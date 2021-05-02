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

Run dmenu\_bw.
If you are not logged in it will ask for your username and password.

If you are logged in, but your session is locked, it will ask for your
password. See configuration/sessionKeyFile

If login was successful or your session was already unlocked, it will show the
main list of actions #create, #sync, and the list of vault items.

* [Copying Passwords](#Copying-Passwords)
* [Creating Vault Items](#Creating-Vault-Items)
* [Editing Vault Items](#Editing-Vault-Items)
* [Deleting Vault Items](#Deleting-Vault-Items)
* [Syncing Vault Items](#Syncing-Vault-Items)

### Copying Passwords
select an item from the main list.
select copy
see [configuration/copyCmds](#copyCmds)

### Creating Vault Items
select create from the main list.
see [configuration/editCmd](#editCmd)

### Editing Vault Items
select an item from the main list.
select edit
see [configuration/editCmd](#editCmd)

### Deleting Vault Items
select an item from the main list.
select delete

### Syncing Vault Items
select sync from the main list.


## Configuration

dmenu\_run looks for ${XDG_CONFIG_HOME}/dmenu_run/config.json. An example
config file is located in /usr/local/share/doc/config.example.json.

- clipboardCmds
- editCmd
- sessionKeyFile
- example config.json

- clipboardCmds
    default:
        "usernameCmds": [
            "xclip -i selection clipboard"
        ],
        "passwordCmds": [
            "xclip -i selection secondary"
        ]
Commands to run on the username and password strings. See example.
Hint: use sxhkd to paste your secondary clipboard
    mod4+v
        sleep 0.25 &&
        xdotool type --clearmodifiers "$(xclip -o -selection primary)"

- editCmd
    default: "xterm -e nano"
The command to run when editing or creating vault items. See example.

- sessionKeyFile
    default: none
The path of the file to output your BW_SESSION shell export whenever a new
session key is generated. If you like this method of session persistence,
simply set sessionKeyFile and source that file in your shell's rc. See example.

- example config.json
    {
        "clipboardCmds": {
            "usernameCmds": [
                "xclip -i selection clipboard",
                "tmux set-buffer"
            ],
            "passwordCmds": [
                "xclip -i selection secondary",
                "tmux set-buffer"
            ]
        },
        "editCmd":"st -e nvim",
        "sessionKeyFile":"/home/foo/.config/zsh/conf.d/99-bitwarden.zsh",
    }

## Contributing
Please share your comments (and commits) on how to make the program better.
