local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("i", "<C-b>", "<C-o>de")
keymap({ "i", "n", "v" }, "<C-c>", [[<C-\><C-n>]])

-- Salir del archivo
keymap("n", "<leader>q", ":q<CR>", opts) -- Cierra el buffer actual

-- Guardar el archivo
keymap("n", "<leader>w", ":w<CR>", opts) -- Guarda el buffer actual

-- Abrir split vertical
keymap("n", "<leader>v", ":vsplit<CR>", opts) -- Divide verticalmente

-- Abrir split horizontal
keymap("n", "<leader>s", ":split<CR>", opts) -- Divide horizontalmente

-- Moverse entre splits usando Ctrl + h/j/k/l
keymap("n", "<C-h>", "<C-w>h", opts) -- Mover al split de la izquierda
keymap("n", "<C-j>", "<C-w>j", opts) -- Mover al split inferior
keymap("n", "<C-k>", "<C-w>k", opts) -- Mover al split superior
keymap("n", "<C-l>", "<C-w>l", opts) -- Mover al split de la derecha
