# dmenu\_bw

![giphy](https://media.giphy.com/media/iEJ7HRPdOpWUrNy3Ue/giphy.gif)

A minimal Bitwarden GUI written in POSIX shellscript. <br>

I created dmenu\_bw as a hotkeyed password manager for minimal window manager
desktop sessions. It is highly inspired by the *workflow* of tiling window
managers, and allows for the rapid lookup, creation, and editing of Bitwarden
vault items. The goal of dmenu\_bw is to provide the same capabilities as the
official Bitwarden client but without the Electron dependency. <br>

Features:
- [x] Fast and light (no electron)!
- [x] Copy passwords!
- [x] Create vault items!
- [x] Edit vault items!

## Table of Contents
* [Dependencies](#Dependencies)
* [Usage](#Usage)
* [Configuration](#Configuration)
* [Contributing](#Contributing)
* [Todo](#Todo)

## Dependencies
* bitwarden-cli (aur)
* dmenu
* yad
* xclip
* libnotify (optional)

## Usage
Run `dmenu_bw`. <br>

If you are not logged in, it will ask for your username and password. <br>

If you are logged in, but your session is locked, it will ask for your
password. See [configuration/sessionKeyFile](#sessionKeyFile) <br>

If login was successful or your session was already unlocked, it will
show the main list of actions [create](#Creating-Vault-Items),
[logout](#Logging-Out), [sync](#Syncing-Vault-Items), and the list of
vault items. <br>

* [Copying Passwords](#Copying-Passwords)
* [Creating Vault Items](#Creating-Vault-Items)
* [Editing Vault Items](#Editing-Vault-Items)
* [Deleting Vault Items](#Deleting-Vault-Items)
* [Syncing Vault Items](#Syncing-Vault-Items)
* [Logging Out](#Logging-Out)

### Copying Passwords
Select an item from the main list and select `copy`. See
[configuration/copyCmds](#copyCmds).

### Creating Vault Items
Select `create` from the main list.

### Editing Vault Items
Select an item from the main list and select `edit`. See
[configuration/editCmd](#editCmd).

### Deleting Vault Items
Select an item from the main list and select `delete`.

### Syncing Vault Items
Select `sync` from the main list.

### Logging Out
Select `logout` from the main list.


## Configuration

dmenu\_bw looks for `${XDG_CONFIG_HOME}/dmenu_bw/config.json`.  If no
file is found, the [default configuration](#Default-Configuration) is
used.

* [Default Configuration](#Default-Configuration)
* [copyCmds](#copyCmds)
* [dmenuOpts](#dmenuOpts)
* [editCmd](#editCmd)
* [sessionKeyFile](#sessionKeyFile)

### Default Configuration
```javascript
{
    "copyCmds": {
        "login": {
            ".login.username": [
                "echo \"$value\" | xclip -i -selection clipboard"
            ],
            ".login.password": [
                "echo \"$value\" | xclip -i -selection primary"
            ]
        },
        "securenote": {},
        "card": {},
        "identity": {}
    },
    "dmenuOpts": "-i -l 10",
    "editCmd": "xterm -e nano",
}
```
Notice that the default behavior is to copy the username to clipboard and
password to primary at the same time. This is so you can paste your username
and password time without having going back and forth to the password manager.
<br>

Hint: use sxhkd to paste your primary clipboard with `Super + v`
```
mod4+v
    sleep 0.25 &&
    xdotool type --clearmodifiers "$(xclip -o -selection primary)"
```

### copyCmds
Contains objects for each of the Bitwarden item types.
Each object contains an array named after the property of said item.
The array contains commands to be evaluated where `$value` is the
value of the property of said item. <br>

e.g. copy usernames and passwords to the clipboard and tmux:
```javascript
"login": {
    ".login.username": [
        "echo \"$value\" | xclip -i -selection clipboard",
        "tmux set-buffer \"$value\""
    ],
    ".login.password": [
        "echo \"$value\" | xclip -i -selection primary",
        "tmux set-buffer \"$value\""
    ]
}
```
e.g. output identities to a file:
```javascript
"identity": {
    ".": [
        "echo \"$value\" > /tmp/bar"
    ]
}
```

### dmenuOpts
Options to pass to the dmenu command.

### editCmd
Editing vault items with yad is not yet supported. Vault items can be edited by
passing the raw JSON item to your editor command.

e.g. edit items with st and nvim
```javascript
"editCmd": "st -e nvim"
```

### sessionKeyFile
The path of the file to output your `BW_SESSION` shell export whenever
a new session key is generated. If you like this method of session
persistence, simply set sessionKeyFile and source that file in your
shell's rc.
```javascript
"sessionKeyFile": "/home/foo/.config/zsh/conf.d/99-bitwarden.zsh"
```

## Contributing
Please share your comments (and commits) on how to make the program better.

## Todo
Here is a list of missing features that are currently being worked on.
- [ ] attachments
- [ ] configuration options at runtime
- [ ] custom fields
- [ ] editing vault items with yad
- [ ] logo
- [ ] more gifs
- [ ] password generator dialog or passwordCmd
