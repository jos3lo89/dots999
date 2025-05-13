return {
	{
		-- Plugin para mostrar vistas previas al navegar entre definiciones, referencias, etc.
		"rmagatti/goto-preview",

		-- Cargar el plugin cuando se entra a un buffer (archivo)
		event = "BufEnter",

		-- Usar la configuración predeterminada del plugin
		config = true,

		-- Definición de atajos de teclado personalizados
		keys = {
			{
				-- Atajo: gpd → Ir a la definición en una ventana de vista previa
				"gpd",
				"<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
				noremap = true,
				desc = "ir a la vista previa de la definición",
			},
			{
				-- Atajo: gpD → Ir a la declaración en una ventana de vista previa
				"gpD",
				"<cmd>lua require('goto-preview').goto_preview_declaration()<CR>",
				noremap = true,
				desc = "ir a la vista previa de la declaración",
			},
			{
				-- Atajo: gpi → Ir a la implementación en una ventana de vista previa
				"gpi",
				"<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
				noremap = true,
				desc = "ir a la vista previa de la implementación",
			},
			{
				-- Atajo: gpy → Ir a la definición de tipo en una ventana de vista previa
				"gpy",
				"<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
				noremap = true,
				desc = "ir a la vista previa de la definición de tipo",
			},
			{
				-- Atajo: gpr → Ir a las referencias en una ventana de vista previa
				"gpr",
				"<cmd>lua require('goto-preview').goto_preview_references()<CR>",
				noremap = true,
				desc = "ir a la vista previa de las referencias",
			},
			{
				-- Atajo: gP → Cerrar todas las ventanas de vista previa abiertas
				"gP",
				"<cmd>lua require('goto-preview').close_all_win()<CR>",
				noremap = true,
				desc = "cerrar todas las ventanas de vista previa",
			},
		},
	},
}
