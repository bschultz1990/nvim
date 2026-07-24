require('vim._core.ui2').enable({
  enable = true,
  msg = {
    ---@type 'cmd'|'msg' Default message target, either in the cmdline or in a separate ephemeral message window.
    ---@type string|table<string, 'cmd'|'msg'|'pager'> Default message target or table mapping |ui-messages| kinds and triggers to a target.
    targets = 'cmd',
    -- Maximum height while expanded for messages beyond 'cmdheight'.
    cmd = {
      height = 0.5
      },
    dialog = {
      height = 0.5,
      },
    msg = { height = 0.5, timeout = 2000, },
    pager = { height = 15, },
  },
})
