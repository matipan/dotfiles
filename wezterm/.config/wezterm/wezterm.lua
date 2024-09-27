
local wezterm = require 'wezterm'

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.color_scheme = 'Tokyo Night Storm'
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 14.0
config.hide_tab_bar_if_only_one_tab = true
return config
