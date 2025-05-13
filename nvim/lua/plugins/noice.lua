return {
	-- Plugin para mejorar las entradas del usuario y mostrar notificaciones elegantes
	"folke/noice.nvim",

	-- Cargar el plugin cuando se inicia Neovim (pero no de forma inmediata)
	event = "VeryLazy",

	-- Opciones de configuración (vacías por ahora, usamos valores por defecto)
	opts = {
		-- Aquí puedes agregar opciones personalizadas más adelante
		-- Por ejemplo:
		-- popupmenu = { kind = "nui" }, -- Usar interfaz moderna para menús
		-- views = { ... }                -- Personalizar cómo se ven los mensajes
		cmdline = {
			view = "cmdline",
		},
		presets = {

			bottom_search = true, -- Activa la búsqueda en la parte inferior
			command_palette = true, -- Habilita la command palette
			lsp_doc_border = true, -- Añade bordes a la documentación LSP
		},
	},

	-- Dependencias necesarias
	dependencies = {
		-- Librería para crear interfaces modernas (ventanas, botones, etc.)
		"MunifTanjim/nui.nvim",

		-- Plugin opcional para mostrar notificaciones bonitas
		-- Si no está instalado, `noice.nvim` usa un fallback con `mini`
		"rcarriga/nvim-notify",
	},
}
