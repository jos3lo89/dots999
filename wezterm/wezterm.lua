local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font_size = 13

config.window_padding = {
	top = 0,
	right = 1,
	left = 1,
	bottom = 0,
}
--
-- config.window_background_opacity = 0.97
-- config.macos_window_background_blur = 20
-- config.win32_system_backdrop = "Acrylic"

config.window_background_image = "C:/Users/lagarto/Pictures/wall/wall7.png"
config.window_background_image_hsb = {
	brightness = 0.08,
	hue = 1.0,
	saturation = 1.0,
}

config.enable_scroll_bar = false
config.max_fps = 240
config.enable_kitty_graphics = true

config.default_domain = "WSL:Ubuntu"

-- -- Configuración de GPU (opcional, solo si tienes una GPU compatible)
-- local gpus = wezterm.gui.enumerate_gpus()
-- if #gpus > 0 then
-- 	config.webgpu_preferred_adapter = gpus[1] -- Usar la primera GPU disponible
-- else
-- 	wezterm.log_info("No GPUs found, using default settings")
-- end

return config
