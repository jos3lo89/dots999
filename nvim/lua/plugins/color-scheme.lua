return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false, -- Cargar inmediatamente
		priority = 1000, -- Alta prioridad para aplicar antes que otros plugins
		config = function()
			require("kanagawa").setup({
				compile = false, -- Desactiva la compilación para facilitar cambios rápidos
				undercurl = true, -- Habilita subrayado con curva para diagnósticos
				commentStyle = { italic = true }, -- Comentarios en cursiva
				functionStyle = { italic = false }, -- Funciones sin cursiva
				keywordStyle = { italic = true }, -- Palabras clave en cursiva
				statementStyle = { bold = true }, -- Sentencias en negrita
				typeStyle = { italic = true }, -- Tipos en cursiva
				transparent = false, -- Fondo transparente
				dimInactive = true, -- Atenúa ventanas inactivas
				terminalColors = true, -- Aplica colores al terminal
				theme = "dragon", -- Variante del tema: "wave" (predeterminado), "dragon", "lotus"
				background = {
					dark = "dragon", -- Tema para fondo oscuro
					light = "lotus", -- Tema para fondo claro
				},
				colors = {
					palette = {
						-- Personaliza colores de la paleta aquí
						-- Ejemplo: sumiInk0 = "#1f1f28",
					},
					theme = {
						wave = {
							ui = {
								float = {
									bg = "none", -- Fondo transparente para ventanas flotantes
								},
								bg_gutter = "none", -- Fondo transparente para el margen
							},
						},
					},
				},
				overrides = function(colors)
					return {
						-- Personaliza grupos de resaltado aquí
						-- Ejemplo: Normal = { bg = "none" },
					}
				end,
			})
			vim.cmd("colorscheme kanagawa") -- Aplica el esquema de colores
		end,
	},
}
