return {
	{ -- Añade guías de indentación incluso en líneas vacías
		-- Plugin: https://github.com/lukas-reineke/indent-blankline.nvim
		"lukas-reineke/indent-blankline.nvim",

		-- Este plugin se carga bajo el módulo principal 'ibl'
		main = "ibl",

		-- Opciones de configuración (en este caso, se usan las predeterminadas)
		opts = {
			-- indent = {
			-- 	char = "+", -- Cambiar el caracter de indentación
			-- 	tab_char = "»",
			-- },
			scope = {
				enabled = true, -- Resaltar el alcance actual (por ejemplo, función donde estás)
				show_start = true, -- Mostrar dónde empieza el bloque
				show_end = true, -- Mostrar dónde termina
			},
		},
	},
}
