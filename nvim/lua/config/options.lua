vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.showmode = false
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.confirm = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Abrir lista [Q]uickfix de diagnósticos" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Salir del modo terminal" })

-- CONSEJO: Deshabilitar teclas de flecha en modo normal
-- vim.keymap.set('n', '<left>', '<cmd>echo "¡Usa h para moverte!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "¡Usa l para moverte!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "¡Usa k para moverte!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "¡Usa j para moverte!!"<CR>')

-- vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Mover el foco a la ventana izquierda" })
vim.keymap.set("n", "<leader>h", "<C-w><C-h>", { desc = "Mover el foco a la ventana izquierda" })
vim.keymap.set("n", "<leader>l", "<C-w><C-l>", { desc = "Mover el foco a la ventana derecha" })
vim.keymap.set("n", "<leader>j", "<C-w><C-j>", { desc = "Mover el foco a la ventana inferior" })
vim.keymap.set("n", "<leader>k", "<C-w><C-k>", { desc = "Mover el foco a la ventana superior" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Salir del archivo" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Guardar el archivo" })
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { desc = "Abrir split vertical" })
vim.keymap.set("n", "<leader>s", ":split<CR>", { desc = "Abrir split horizontal" })

-- NOTA: Algunos terminales tienen atajos que colisionan o no pueden enviar códigos de tecla distintos
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Mover ventana a la izquierda" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Mover ventana a la derecha" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Mover ventana hacia abajo" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Mover ventana hacia arriba" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Resaltar al copiar texto",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
