
local wezterm = require 'wezterm'

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

local function has_nvidia_gpu()
    local handle = io.popen("lspci -k | grep -A 2 -E '(VGA|3D)' | grep -iq nvidia && echo 'true' || echo 'false'")
    local result = handle:read("*a")
    handle:close()
    return result:gsub("%s+", "") == "true"
end

-- Determine the font size based on NVIDIA presence
config.font_size = has_nvidia_gpu() and 14 or 12

-- This is where you actually apply your config choices
config.color_scheme = 'Tokyo Night Storm'
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.hide_tab_bar_if_only_one_tab = true
return config
