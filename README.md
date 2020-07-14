#dothammerspoon

This is my [Hammerspoon](https://hammerspoon.org) config. It's mostly ported from my Karabiner-Elements config, but I'll probably be updating it over time.

As of writing this README.md, it does the following:
- Key remapping:
  - <code>Control</code> → hold for <code>Control</code>, tap for <code>Escape</code>. (I then have <code>Caps Lock</code> remapped to <code>Control</code>)
    - via https://github.com/jasonrudolph/ControlEscape.spoon
  - <code>Tab</code> → hold for <code>fn</code>, tap for <code>Tab</code>.
    - via [tab.lua](tab.lua)
  - <code>fn</code> + [hjkl] → "Vi mode" arrows
    - via [vikeys.lua](vikeys.lua)
