# dmenu\_bw

A dmenu wrapper for bitwarden-cli written in POSIX shellscript.

dmenu_bw is optimized rapidly copying, creating and editing passwords NO
ELECTRON!!

features:
    check: fast (no electron)
    check: copy passwords!
    check: edit vault items!
    check: create vault items!

# dependencies
- bitwarden-cli (aur)
- dmenu
- yad
- xclip

# usage

Run dmenu\_bw.
If you are not logged in it will ask for your username and password.
If you are logged in, but your session is locked, it will ask for your password. See configuration/sessionKeyFile
If login was successful or your session was already unlocked, it will show the main list of actions #create, #sync, and the list of vault items.

- copying passwords
- creating vault items
- editing vault items
- deleting vault items
- syncing vault items

* copying passwords
select an item from the main list.
select copy
see configuration/clipboardCmds

* creating vault items
select create from the main list.
see configuration/editCmd

* editing vault items
select an item from the main list.
select edit
see configuration/editCmd

* deleting vault items
select an item from the main list.
select delete

* syncing vault items
select sync from the main list.


# configuration

dmenu\_run looks for ${XDG_CONFIG_HOME}/dmenu_run/config.json. An example
config file is located in blah/config.example.json.

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

# contributing
Please share your comments (and commits) on how to make the program better.
