$env.config.keybindings ++= [
  {
    name: zi_ctrl_u
    modifier: control
    keycode: char_u
    mode: emacs
    event: {
      send: ExecuteHostCommand
      cmd: "zi"
    }
  }
  {
    name: z_dash_ctrl_p
    modifier: control
    keycode: char_p
    mode: emacs
    event: {
      send: ExecuteHostCommand
      cmd: "z -"
    }
  }
  {
    name: zmx_select_ctrl_x
    modifier: control
    keycode: char_x
    mode: emacs
    event: {
      send: ExecuteHostCommand
      cmd: "zmx-select"
    }
  }
]
