-- nvim-autopairs plugin for Neovim
-- https://github.com/windwp/nvim-autopairs

-- Este plugin se encarga de insertar automáticamente los caracteres de cierre (como ), }, ])
-- cuando escribes sus correspondientes aperturas (como (, {, [) en modo inserción.

return {
	"windwp/nvim-autopairs",

	-- Condición bajo la cual se carga el plugin
	-- En este caso, el plugin se carga cuando entras en modo de inserción (InsertEnter)
	event = "InsertEnter",

	-- Opciones de configuración del plugin
	-- opts = {} significa que se usan las opciones por defecto del plugin.
	opts = {},
}
