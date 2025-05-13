return {
	{
		"ibhagwan/fzf-lua", -- Plugin principal: interfaz fuzzy basada en fzf (requiere tener fzf instalado)
		event = "BufEnter", -- Carga el plugin cuando se entra a un buffer (inicio perezoso)
		opts = {
			winopts = {
				preview = {
					default = "bat", -- Usa 'bat' para previsualizar archivos (si está instalado)
					border = "rounded", -- Usa bordes redondeados en la ventana
				},
				width = 0.8, -- Ancho de la ventana de fzf-lua (80% del total)
				height = 0.8, -- Altura de la ventana de fzf-lua (80% del total)
			},
			files = {
				prompt = "Files -> ", -- Texto que aparece antes del input en búsqueda de archivos
				cmd = "rg --files --hidden --no-ignore --iglob '!{node_modules,dist,.git}'",
				-- Comando personalizado con `ripgrep` para listar archivos, ignora carpetas comunes innecesarias
				actions = {
					-- Acciones personalizadas al seleccionar un archivo
					-- ["default"] = require("fzf-lua.actions").file_edit_or_qf, -- Abre archivo o agrega a quickfix si hay múltiples resultados
					-- ["ctrl-x"] = require("fzf-lua.actions").file_split, -- Abrir archivo en split horizontal
					-- ["ctrl-v"] = require("fzf-lua.actions").file_vsplit, -- Abrir archivo en split vertical
					-- ["ctrl-t"] = require("fzf-lua.actions").file_tabedit, -- Abrir archivo en nueva pestaña
				},
			},
			grep = {
				prompt = "Grep> ", -- Texto que aparece antes del input en búsqueda de texto
				input_prompt = "Texto> ", -- Texto que aparece cuando se pide al usuario ingresar texto
				rg_opts = "--hidden --column --line-number --no-heading --color=always --smart-case --iglob '!{node_modules,dist,.git}'",
				-- Opciones para `ripgrep`, incluyendo mostrar resultados ocultos y con colores
			},
			-- === OPCIONES ADICIONALES ÚTILES ===
			keymap = {
				builtin = {
					["<F1>"] = "toggle-help", -- F1 abre/oculta la ayuda integrada
					["<F2>"] = "toggle-fullscreen", -- F2 alterna entre ventana normal y pantalla completa
				},
			},
			previewers = {
				builtin = {
					syntax = true, -- Activa resaltado de sintaxis en previsualización
					treesitter = true, -- Usa TreeSitter para mejor resaltado si está disponible
				},
			},
		},
		keys = {
			{ "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", desc = "Buscar archivos" },
			{ "<leader>fg", "<cmd>lua require('fzf-lua').live_grep()<CR>", desc = "Buscar texto (Live Grep)" },
			{ "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<CR>", desc = "Buscar buffers abiertos" },
			{ "<leader>fh", "<cmd>lua require('fzf-lua').help_tags()<CR>", desc = "Buscar ayuda (tags)" },

			-- === MAPEOS EXTRA OPCIONALES ===
			{ "<leader>fc", "<cmd>lua require('fzf-lua').commands()<CR>", desc = "Buscar comandos de Neovim" },
			{ "<leader>fr", "<cmd>lua require('fzf-lua').resume()<CR>", desc = "Reabrir última búsqueda" },
			{ "<leader>fm", "<cmd>lua require('fzf-lua').marks()<CR>", desc = "Buscar marcadores" },
			{ "<leader>fk", "<cmd>lua require('fzf-lua').keymaps()<CR>", desc = "Buscar atajos de teclado" },
			{ "<leader>ft", "<cmd>lua require('fzf-lua').tabs()<CR>", desc = "Buscar pestañas abiertas" },
			{ "<leader>fs", "<cmd>lua require('fzf-lua').grep_cword()<CR>", desc = "Buscar palabra bajo el cursor" },
		},
	},
}
