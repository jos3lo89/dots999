return {
	-- Plugin principal para configurar LSP (Language Server Protocol) en Neovim
	"neovim/nvim-lspconfig",

	-- Plugins adicionales que ayudan con LSP
	dependencies = {
		-- Mason: manejador de instalación de servidores LSP
		{ "williamboman/mason.nvim", opts = {} },

		-- Conecta Mason con nvim-lspconfig para instalar LSPs automáticamente
		"williamboman/mason-lspconfig.nvim",

		-- Instala herramientas adicionales como formatters y linters
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Muestra una interfaz con notificaciones del LSP
		{ "j-hui/fidget.nvim", opts = {} },

		-- Plugin personalizado para configurar capacidades de autocompletado (reemplaza nvim-cmp)
		"saghen/blink.cmp",
	},

	-- Función de configuración principal
	config = function()
		-- Cuando un LSP se conecta a un buffer...
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				-- Función para mapear teclas con descripción y modo
				local map = function(keys, func, desc, mode)
					mode = mode or "n" -- Por defecto en modo normal
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- Obtener el cliente LSP conectado
				local client = vim.lsp.get_client_by_id(event.data.client_id)

				-- Función que verifica si el cliente soporta un método específico
				local function client_supports_method(client, method, bufnr)
					if vim.fn.has("nvim-0.11") == 1 then
						return client:supports_method(method, bufnr)
					else
						return client.supports_method(method, { bufnr = bufnr })
					end
				end

				-- Si el cliente soporta resaltado de documentos...
				if
					client
					and client_supports_method(
						client,
						vim.lsp.protocol.Methods.textDocument_documentHighlight,
						event.buf
					)
				then
					-- Crear grupo de autocmd para el resaltado
					local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })

					-- Resaltar referencias cuando el cursor se detiene
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					-- Limpiar resaltado cuando el cursor se mueve
					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					-- Limpiar cuando se desconecta el LSP
					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
						end,
					})
				end

				-- Si el cliente soporta pistas en línea (inlay hints)
				if
					client
					and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
				then
					-- Mapeo para alternar las inlay hints
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})

		-- Configuración para los diagnósticos del LSP
		vim.diagnostic.config({
			severity_sort = true, -- Ordenar por severidad
			float = { border = "rounded", source = "if_many" }, -- Borde y fuente en flotante
			underline = { severity = vim.diagnostic.severity.ERROR }, -- Solo subrayar errores
			-- Signos en la columna lateral si tienes Nerd Fonts
			signs = vim.g.have_nerd_font and {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			} or {},
			virtual_text = {
				source = "if_many", -- Solo mostrar fuente si hay múltiples diagnósticos
				spacing = 2,
				format = function(diagnostic)
					return diagnostic.message -- Solo el mensaje
				end,
			},
		})

		-- Obtener capacidades del LSP desde el plugin blink.cmp
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- Lista de servidores LSP con su configuración
		local servers = {
			clangd = {},
			rust_analyzer = {},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace", -- Evita duplicar texto en snippets
						},
						-- diagnostics = { disable = { "missing-fields" } }, -- Puedes habilitar esto si quieres
					},
				},
			},
		}

		-- Lista de herramientas a asegurar instalación
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Formateador de código para Lua
		})

		-- Instala herramientas con mason-tool-installer
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		-- Configura mason-lspconfig
		require("mason-lspconfig").setup({
			ensure_installed = {}, -- No instala automáticamente aquí
			automatic_installation = false, -- Instalación manual o vía tool-installer
			handlers = {
				-- Manejador por defecto para cada servidor
				function(server_name)
					local server = servers[server_name] or {}

					-- Combinar capacidades de autocompletado con capacidades del servidor
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})

					-- Configurar el servidor con nvim-lspconfig
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
