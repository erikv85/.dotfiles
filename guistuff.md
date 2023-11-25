Misc sneaky settings, gui stuff or things I don't know how or care to
automate in some script.

# Ubuntu 20.04

Might have to disable "natural scrolling":
`Settings -> Mouse & Touchpad -> toggle off 'Natural scrolling' as desired`

Not gui-specific, but:
Continuously resize tmux pane, e.g. "down"
`^B Alt <arrow down> <arrow down> <arrow down>`

'sh' should point to bash, not dash
`sudo dpkg-reconfigure dash`
then choose not to use dash

## Remove software update pop-up

This will also remove ubuntu-desktop, which looks scary but is safe

`sudo apt remove update-notifier`

## Remove pop-ups about "System program problem detected"

edit /etc/default/apport from enabled=1 to enabled=0, i.e.
`sed -i 's/\(enabled=\)1/\10/g' /etc/default/apport`

might also want to clear existing reports:

`rm /var/crash/*`

## Remap capslock to ctrl

```
sudo apt install -y gnome-tweaks
  Open gnome-tweaks -> Keyboard & Mouse -> Additional Layout Options
  -> Caps Lock behavior -> "Caps Lock is also a Ctrl"
```

## Remove dock (panel on the left with program shortcuts)
```
sudo apt install -y gnome-shell-extensions
  Open extensions -> disable "Ubuntu Dock"
```

# Ubuntu 18.04

Don't group instances of same program when alt+tab ([source](https://askubuntu.com/a/1119120))
```
  Settings -> Devices -> Keyboard
  Find 'Switch windows'
  Enter Alt+Tab as shortcut
```

Install Chrome Web Store's shortkeys in Brave
([extension link](https://chrome.google.com/webstore/detail/shortkeys-custom-keyboard/logpjaacgmcbpdkdchjiaagddngobkck?page=1&hl=sv&itemlang=ml))
  In Brave,
    go to brave://extensions
    Enable 'Developer mode'
    Click 'Load unpacked'
    Select and open the directory whose name is something like this:
      ~/.config/google-chrome/Default/Extensions/logpjaa.../3.0.7_0
    Done. Then import this json:

```json
    [ {
        "sites": "",
        "sitesArray": [
          ""
        ],
        "key": "j",
        "action": "scrolldown"
      },
      {
        "key": "k",
        "action": "scrollup",
        "sites": "",
        "sitesArray": [
          ""
        ]
      },
      {
        "key": "d",
        "action": "pagedown",
        "sites": "",
        "sitesArray": [
          ""
        ]
      },
      {
        "key": "u",
        "action": "pageup",
        "sites": "",
        "sitesArray": [
          ""
        ]
      },
      {
        "key": "g",
        "action": "top",
        "sites": "",
        "sitesArray": [
          ""
        ]
      },
      {
        "key": "$",
        "action": "bottom",
        "sites": "",
        "sitesArray": [
          ""
        ]
      }
  ]
```
