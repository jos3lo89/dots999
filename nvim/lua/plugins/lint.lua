return {
	{ -- Linting (verificación de estilo y errores en el código)
		"mfussenegger/nvim-lint",

		-- Cargar el plugin cuando se abre un archivo existente o se crea uno nuevo
		event = { "BufReadPre", "BufNewFile" },

		-- Función de configuración principal
		config = function()
			local lint = require("lint")

			-- Asignamos linters según el tipo de archivo (filetype)
			lint.linters_by_ft = {
				markdown = { "markdownlint" }, -- Para archivos Markdown
				typescript = { "eslint" }, -- Para TypeScript
				typescriptreact = { "eslint" }, -- Para React con TypeScript
			}

			-- NOTA: Si otros plugins también quieren añadir linters,
			-- podrías usar esta forma más segura:
			--
			-- lint.linters_by_ft = lint.linters_by_ft or {}
			-- lint.linters_by_ft['markdown'] = { 'markdownlint' }

			-- ⚠️ Advertencia: El plugin tiene linters predeterminados para varios tipos de archivo.
			-- Estos linters se activan a menos que los desactives explícitamente.
			-- Ejemplo:
			--
			-- lint.linters_by_ft['clojure'] = nil
			-- lint.linters_by_ft['dockerfile'] = nil

			-- Creamos un grupo de autocomandos para ejecutar el linter automáticamente
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			-- Configuramos cuándo debe ejecutarse el linter:
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					-- Solo ejecutar el linter en archivos modificables
					if vim.opt_local.modifiable:get() then
						lint.try_lint()
					end
				end,
			})
		end,
	},
}
