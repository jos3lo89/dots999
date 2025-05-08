-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- vim.cmd("autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++17 % -o %:p:r<CR>")
-- vim.cmd("autocmd filetype cpp nnoremap <F10> :sp <CR> :term %:p:r<CR>")

-- Configuración de autocmds para C++

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
