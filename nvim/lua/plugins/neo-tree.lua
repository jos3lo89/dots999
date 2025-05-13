-- Neo-tree es un plugin moderno para navegar por el sistema de archivos, buffers, Git, etc.
-- Soporta varios estilos (sidebar, float, netrw) y se integra bien con iconos y temas.
-- GitHub: https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*", -- Usar última versión disponible

	dependencies = {
		"nvim-lua/plenary.nvim", -- Librería de utilidades Lua para Neovim
		"nvim-tree/nvim-web-devicons", -- Muestra iconos bonitos para los archivos
		"MunifTanjim/nui.nvim", -- Componentes UI reutilizables
	},

	cmd = "Neotree", -- Cargar solo cuando se usa el comando :Neotree

	keys = {
		{
			"<leader>e", -- Atajo principal: <leader>e
			":Neotree toggle<CR>", -- Abre o cierra Neo-tree
			desc = "NeoTree: Toggle Sidebar", -- Descripción del atajo
			silent = true, -- No mostrar mensaje mientras se ejecuta
		},
	},

	opts = {
		filesystem = {
			window = {
				mappings = {
					["q"] = "close_window", -- Salir con 'q'
					["<esc>"] = "close_window", -- También puedes salir con Esc
					["l"] = "open",
				},
			},
		},
	},
}
