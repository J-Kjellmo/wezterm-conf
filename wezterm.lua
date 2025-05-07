-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.use_fancy_tab_bar = false

config.default_cursor_style = 'BlinkingUnderline'

config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.5,
}

-- For example, changing the color scheme:
config.color_scheme = 'Nightlion V1'

config.colors = {
  foreground = 'white',
  background = 'rgba(0% 0% 0% 50%)',

  tab_bar = {
    background = '#0b0022',

    active_tab = {
      bg_color = '#2b2042',
      fg_color = '#c0c0c0',
      intensity = 'Normal',
      underline = 'None',
      italic = false,
      strikethrough = false,
    },

    inactive_tab = {
      bg_color = '#1b1032',
      fg_color = '#808080',
    },

    inactive_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,
    },

    new_tab = {
      bg_color = '#1b1032',
      fg_color = '#808080',
    },

    new_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,
    },
  },
}

config.keys = {
  -- create new panes
  { key = "l", mods = "SUPER", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = "h", mods = "SUPER", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },

  -- Adjust sized with arrow keys
  { key = "LeftArrow", mods = "SUPER", action = wezterm.action.AdjustPaneSize { "Left", 1 } },
  { key = "RightArrow", mods = "SUPER", action = wezterm.action.AdjustPaneSize { "Right", 1 } },
  { key = "UpArrow", mods = "SUPER", action = wezterm.action.AdjustPaneSize { "Up", 1 } },
  { key = "DownArrow", mods = "SUPER", action = wezterm.action.AdjustPaneSize { "Down", 1 } },

  -- Shift focus with arrow keys
  { key = "LeftArrow", mods = "SUPER|SHIFT", action = wezterm.action.ActivatePaneDirection "Left" },
  { key = "RightArrow", mods = "SUPER|SHIFT", action = wezterm.action.ActivatePaneDirection "Right" },
  { key = "UpArrow", mods = "SUPER|SHIFT", action = wezterm.action.ActivatePaneDirection "Up" },
  { key = "DownArrow", mods = "SUPER|SHIFT", action = wezterm.action.ActivatePaneDirection "Down" },

  -- create new tabs
  { key = "t", mods = "SUPER", action = wezterm.action.SpawnTab "DefaultDomain" },

  -- close tab
  { key = "q", mods = "SUPER", action = wezterm.action.CloseCurrentTab { confirm = false } },

  -- Adjust font sizes
  { key = "UpArrow", mods = "SUPER|CTRL", action = wezterm.action.IncreaseFontSize },
  { key = "DownArrow", mods = "SUPER|CTRL", action = wezterm.action.DecreaseFontSize },

  -- Toggle fullscreen
  { key = "f", mods = "SUPER", action = wezterm.action.ToggleFullScreen },
}

-- and finally, return the configuration to wezterm
return config
