return {
	{ -- Colección de módulos pequeños e independientes para mejorar tu experiencia en Neovim
		"echasnovski/mini.nvim",

		-- Configuración del plugin
		config = function()
			-- === mini.ai ===
			-- Mejora los textobjects (objetos de texto) como 'inner' y 'around'
			-- Útil para operaciones como borrar, cambiar o seleccionar dentro/cerca de paréntesis, comillas, etc.
			--
			-- Ejemplos:
			-- - va)   → Selecciona [V]isualmente [A]lrededor de un paréntesis
			-- - yinq" → Copia [Y] lo que está [I]nside de las comillas siguientes
			-- - ci'   → Cambia [C] lo que está [I]nside de una comilla simple
			require("mini.ai").setup({ n_lines = 500 }) -- Analiza hasta 500 líneas para encontrar objetos

			-- === mini.surround ===
			-- Permite añadir, eliminar o reemplazar elementos que rodean texto (como comillas, paréntesis, etiquetas HTML, etc.)
			--
			-- Ejemplos:
			-- - saiw) → [S]urround [A]dd [I]nner [W]ord with )
			-- - sd'   → [S]urround [D]elete surrounding '
			-- - sr)'  → [S]urround [R]eplace ) with '
			require("mini.surround").setup() -- Configura el módulo con valores predeterminados

			-- === mini.statusline ===
			-- Una statusline minimalista y elegante
			local statusline = require("mini.statusline")

			-- Configura la statusline
			statusline.setup({
				use_icons = vim.g.have_nerd_font, -- Usa iconos si tienes una Nerd Font instalada
			})

			-- Personalización opcional: cambia cómo se muestra la ubicación del cursor
			-- En este caso, se muestra como LINE:COLUMN
			-- @diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end

			-- === Y hay más módulos disponibles ===
			-- Este plugin contiene muchos otros módulos útiles, como:
			-- - mini.comment     → Comentar/descomentar líneas fácilmente
			-- - mini.move        → Mover bloques de texto fácilmente
			-- - mini.pairs       → Autopares (paréntesis, corchetes, llaves)
			-- - mini.align       → Alinear texto interactivo
			-- - mini.indentscope → Visualizar el scope de indentación
			-- - mini.cursorword  → Resaltar automáticamente la palabra bajo el cursor
			-- - mini.trailspace  → Eliminar espacios al final de las líneas
			-- - mini.doc         → Generar documentación rápida
			-- - ...y muchos más!

			-- Puedes revisar todos los módulos aquí:
			-- https://github.com/echasnovski/mini.nvim
		end,
	},
}
