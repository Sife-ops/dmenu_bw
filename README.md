# dmenu\_bw

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
If you are not logged in it will ask for your username and password. <br>

If you are logged in, but your session is locked, it will ask for your
password. See [configuration/sessionKeyFile](#sessionKeyFile) <br>

If login was successful or your session was already unlocked, it will show the
main list of actions [create](#Creating-Vault-Items),
[sync](#Syncing-Vault-Items), and the list of vault items. <br>

* [Copying Passwords](#Copying-Passwords)
* [Creating Vault Items](#Creating-Vault-Items)
* [Editing Vault Items](#Editing-Vault-Items)
* [Deleting Vault Items](#Deleting-Vault-Items)
* [Syncing Vault Items](#Syncing-Vault-Items)

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


## Configuration

dmenu\_run looks for ${XDG\_CONFIG\_HOME}/dmenu\_bw/config.json.
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
                "xclip -i selection clipboard"
            ],
            ".login.password": [
                "xclip -i selection secondary"
            ]
        },
        "secure_note": {},
        "card": {},
        "identity": {}
    },
    "editCmd": "xterm -e nano",
}
```
Hint: use sxhkd to paste your secondary clipboard
```
mod4+v
    sleep 0.25 &&
    xdotool type --clearmodifiers "$(xclip -o -selection primary)"
```

### copyCmds
Commands to run on the username and password strings.

### editCmd
The command to run when editing or creating vault items.

### sessionKeyFile
The path of the file to output your BW\_SESSION shell export whenever a new
session key is generated. If you like this method of session persistence,
simply set sessionKeyFile and source that file in your shell's rc.

## Contributing
Please share your comments (and commits) on how to make the program better.
