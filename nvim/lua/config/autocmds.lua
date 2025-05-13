vim.api.nvim_create_autocmd("FileType", {
	pattern = "cpp",
	callback = function()
		-- F9: Compilar el archivo con g++
		vim.keymap.set("n", "<F9>", function()
			vim.cmd("w")
			vim.cmd("!g++ -std=c++17 % -o %:p:r && echo '✅ Compilado correctamente'")
		end, { buffer = true, desc = "Compilar archivo C++" })

		-- F10: Ejecutar el binario en un split horizontal de 15 líneas y entrar en modo insert
		vim.keymap.set("n", "<F10>", function()
			local executable = vim.fn.expand("%:p:r")
			vim.cmd("belowright split | resize 15")
			vim.cmd("terminal " .. executable)
			vim.cmd("startinsert") -- Entra al modo insert automáticamente
		end, { buffer = true, desc = "Ejecutar binario" })

		-- F8: Limpiar binario
		vim.keymap.set("n", "<F8>", function()
			vim.cmd("!rm -f %:p:r && echo '🧹 Binario eliminado'")
		end, { buffer = true, desc = "Eliminar binario compilado" })
	end,
})
