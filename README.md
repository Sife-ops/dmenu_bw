# dmenu\_bw

![dmenu\_bw](https://imgur.com/a/VigOLAs)

A dmenu wrapper for bitwarden-cli written in POSIX shellscript.

features:
- [x] fast (no electron)!
- [x] copy passwords!
- [x] edit vault items!
- [x] create vault items!

## Table of Contents
* [Dependencies](#Dependencies)
* [Usage](#Usage)
* [Configuration](#Configuration)
* [Contributing](#Contributing)

## Dependencies
* bitwarden-cli (aur)
* dmenu
* yad
* xclip

## Usage

Run dmenu\_bw. <br>
If you are not logged in, it will ask for your username and password. <br>

If you are logged in, but your session is locked, it will ask for your
password. See [configuration/sessionKeyFile](#sessionKeyFile) <br>

If login was successful or your session was already unlocked, it will show the
main list of actions [create](#Creating-Vault-Items),
[logout](#Logging-Out), [sync](#Syncing-Vault-Items), and the list of vault items. <br>

* [Copying Passwords](#Copying-Passwords)
* [Creating Vault Items](#Creating-Vault-Items)
* [Editing Vault Items](#Editing-Vault-Items)
* [Deleting Vault Items](#Deleting-Vault-Items)
* [Syncing Vault Items](#Syncing-Vault-Items)
* [Logging Out](#Logging-Out)

### Copying Passwords
Select an item from the main list and select *copy*. See
[configuration/copyCmds](#copyCmds).

### Creating Vault Items
Select *create* from the main list. See [configuration/editCmd](#editCmd).

### Editing Vault Items
Select an item from the main list and select *edit*. See
[configuration/editCmd](#editCmd).

### Deleting Vault Items
Select an item from the main list and select *delete*.

### Syncing Vault Items
Select *sync* from the main list.

### Logging Out
Select *logout* from the main list.


## Configuration

dmenu\_bw looks for ${XDG\_CONFIG\_HOME}/dmenu\_bw/config.json.
If no configuration file is found, the [default
configuration](#Default-Configuration) is used.

* [Default Configuration](#Default-Configuration)
* [copyCmds](#copyCmds)
* [editCmd](#editCmd)
* [sessionKeyFile](#sessionKeyFile)

<!-- An example config file is located in
/usr/local/share/doc/config.example.json. -->

### Default Configuration
```
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
        "secure_note": {},
        "card": {},
        "identity": {}
    },
    "editCmd": "xterm -e nano",
}
```
Hint: use sxhkd to paste your primary clipboard
```
mod4+v
    sleep 0.25 &&
    xdotool type --clearmodifiers "$(xclip -o -selection primary)"
```

### copyCmds
Contains objects for each of the bitwarden item types.
Each object contains an array named after the property of said item.
The array contains commands to be evaluated where *$value* is the
value of the property of said item. <br>

e.g. copy usernames and passwords to the clipboard and tmux:
```
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
```
"identity": {
    ".": [
        "echo \"$value\" > /tmp/bar"
    ]
}
```

### editCmd
The command to run when editing or creating vault items.<br>

e.g. open files with in st with nvim
```
"editCmd": "st -e nvim"
```

### sessionKeyFile
The path of the file to output your BW\_SESSION shell export whenever a new
session key is generated. If you like this method of session persistence,
simply set sessionKeyFile and source that file in your shell's rc.
```
"sessionKeyFile": "/home/foo/.config/zsh/conf.d/99-bitwarden.zsh"
```

## Contributing
Please share your comments (and commits) on how to make the program better.
