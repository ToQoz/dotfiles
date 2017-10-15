# personal dotfiles

manual operations are remaining...

- Register a ssh public key
  - `$ ssh-keygen -t rsa -b 4096 -C "toqoz403@gmail.com"`
  - add `~/.ssh/id_rsa.pub` to https://github.com/settings/keys
- `$ curl -sf -L https://raw.githubusercontent.com/ToQoz/dotfiles/master/bootstrap | sh`
- Install SandS.app
- Configure iTerm.app profile
  - iTerm.app Preferences > Profiles > Default
    - General > Color Presets... > Nord
    - Text > Change Font > 14pt Source Code Pro
    - Keys > {Left, Right} Option Key > Esc+
- Preferences.app
  - General > Use dark menu bar and Dock
  - Sharing > Computer Name
  - Security & Privacy > Privacy > Accessibility
    - Hammerspoon
    - Slate
    - SandS
  -  Keyboard
    - Keyboard > Modifier Keys > CapsLock → Control
    - Input Sources
      - Add AquaSKK sources
      - Logout from computer
- Sign in (Google/GitHub/Slack etc)

