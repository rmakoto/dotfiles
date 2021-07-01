# iTerm

## Useful settings

### [Set keyboard cursor shortcuts][2]

1. iTerm2 -> Preferences: `⌘ + ,`
2. Open Profile tab
3. Select Keys tab
4. Add the following Shortcut Keys

#### Move cursor one word left

* Keyboard Combination: `⌥ + ←`
* Action: Send Hex Code
* Code: 0x1b 0x62

#### Move cursor one word right

* Keyboard Combination: `⌥ + →`
* Action: Send Hex Code
* Code: 0x1b 0x66

#### Move cursor to beginning of line

* Keyboard Combination: `⌘ + ←`
* Action: Send Hex Code
* Code: 0x01

#### Move cursor to end of line

* Keyboard Combination: `⌘ + →`
* Action: Send Hex Code
* Code: 0x05

#### Delete word

* Keyboard Combination: `⌥ + ←Delete`
* Action: Send Hex Code
* Code: 0x1b 0x08

#### Delete line

* Keyboard Combination: `⌘ + ←Delete`
* Action: Send Hex Code
* Code: 0x15

#### Undo

* Keyboard Combination: `⌘ + z`
* Action: Send Hex Code
* Code: 0x1f

#### [Disable annoying reset shortcut][1]

* Remap `cmd + r` to "ignore" in keys mapping
* Remap `cmd + k` to "ignore" in keys mapping

#### Don't forget to remove the previous bindings

* Open the “Profiles” tab
* Click the sub-tab ”Keys”
* Remove the mappings for key combinations ⌥ + ← and ⌥ + →

### Tmux

#### [How to copy and paste with a mouse with tmux][3]
* iTerm2 > Preferences > “General” tab, and in the “Selection” section, check “Applications in terminal may access clipboard”.

[1]: <https://code.i-harness.com/en/q/5eaee5>

[2]: <https://superuser.com/questions/800088/why-does-cmd-r-mess-up-vim-on-the-mac-what-is-it-actually-trying-to-do>

[3]: <https://unix.stackexchange.com/questions/318281/how-to-copy-and-paste-with-a-mouse-with-tmux>