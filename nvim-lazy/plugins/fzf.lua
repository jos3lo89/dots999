return {
  {
    "ibhagwan/fzf-lua",
    event = "BufEnter",
    opts = {
      winopts = {
        preview = {
          default = "bat", -- Usa 'bat' para previsualizar archivos (si está instalado)
          border = "rounded", -- Bordes redondeados
        },
        width = 0.8, -- Ancho de la ventana
        height = 0.8, -- Altura de la ventana
      },
      files = {
        prompt = "Files -> ", -- Cambia el prefijo de búsqueda
        cmd = "rg --files --hidden --no-ignore --iglob '!{node_modules,dist,.git}'", -- Ignora carpetas innecesarias
      },
      grep = {
        prompt = "Grep> ", -- Cambia el prefijo de búsqueda de texto
        input_prompt = "Texto> ", -- Prompt para entrada manual
        rg_opts = "--hidden --column --line-number --no-heading --color=always --smart-case --iglob '!{node_modules,dist,.git}'",
      },
    },
    keys = {
      { "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", desc = "Buscar archivos" },
      { "<leader>fg", "<cmd>lua require('fzf-lua').live_grep()<CR>", desc = "Buscar texto" },
      { "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<CR>", desc = "Buscar buffers abiertos" },
      { "<leader>fh", "<cmd>lua require('fzf-lua').help_tags()<CR>", desc = "Buscar ayuda" },
    },
  },
}
