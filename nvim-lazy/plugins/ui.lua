return {
	"folke/snacks.nvim",
	opts = function(_, opts)
		-- Encabezado ASCII personalizado con el texto "jos3lo"
		opts.dashboard.preset.header = [[
     ██╗ ██████╗ ███████╗██████╗ ██╗      ██████╗
     ██║██╔═══██╗██╔════╝╚════██╗██║     ██╔═══██╗
     ██║██║   ██║███████╗ █████╔╝██║     ██║   ██║
██   ██║██║   ██║╚════██║ ╚═══██╗██║     ██║   ██║
╚█████╔╝╚██████╔╝███████║██████╔╝███████╗╚██████╔╝
 ╚════╝  ╚═════╝ ╚══════╝╚═════╝ ╚══════╝ ╚═════╝
    ]]
		return opts
	end,
}
