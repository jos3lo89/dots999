return {
	-- Declara el plugin 'incline.nvim' de GitHub
	"b0o/incline.nvim",

	-- Evento que activa la carga del plugin: antes de leer un buffer (optimiza el tiempo de carga)
	event = "BufReadPre",

	-- Prioridad de carga: más alto significa que se carga antes que otros plugins con menor prioridad
	priority = 1200,

	-- Función de configuración que se ejecuta al cargar el plugin
	config = function()
		-- Llama al método setup del plugin 'incline' para configurarlo
		require("incline").setup({

			-- Configuración de la ventana flotante que muestra el título
			window = {
				-- Márgenes de la ventana flotante respecto al buffer
				margin = { vertical = 0, horizontal = 1 },
			},

			-- Opciones para ocultar la barra en ciertas condiciones
			hide = {
				-- Oculta la barra de título si está activada la línea de cursor
				cursorline = true,
			},

			-- Función que define cómo se va a renderizar la barra de título por buffer
			render = function(props)
				-- Obtiene el nombre del archivo actual del buffer, sólo el nombre (sin ruta)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")

				-- Si el buffer ha sido modificado (no guardado), añade un indicador [+]
				if vim.bo[props.buf].modified then
					filename = "[+] " .. filename
				end

				-- Obtiene un ícono y un color según la extensión del archivo, usando nvim-web-devicons
				local icon, color = require("nvim-web-devicons").get_icon_color(filename)

				-- Devuelve una tabla con los elementos que se van a mostrar en la barra:
				-- ícono (con color), espacio en blanco y el nombre del archivo
				return {
					{ icon, guifg = color }, -- icono con color
					{ " " }, -- espacio en blanco
					{ filename }, -- nombre del archivo
				}
			end,
		})
	end,
}
