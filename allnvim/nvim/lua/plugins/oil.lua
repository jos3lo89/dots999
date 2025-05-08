return {
  -- Plugin: oil.nvim
  -- Descripción: Un plugin de Neovim para gestionar y navegar directorios.
  "stevearc/oil.nvim",

  opts = {
    -- Asignaciones de teclas para las acciones de oil.nvim
    keymaps = {
      ["g?"] = "actions.show_help", -- Mostrar ayuda
      ["<CR>"] = "actions.select", -- Seleccionar entrada

      ["<C-S>"] = { "actions.select", opts = { vertical = true }, desc = "Abrir en división vertical" },
      -- ["<C-M-s>"] = {
      --   "actions.select",
      --   opts = { vertical = true },
      --   desc = "Abrir la entrada en una división vertical",
      -- }, -- Abrir entrada en división vertical
      ["<C-d>"] = {
        "actions.select",
        opts = { horizontal = true },
        desc = "Abrir la entrada en una división horizontal",
      }, -- Abrir entrada en división horizontal
      ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Abrir la entrada en una nueva pestaña" }, -- Abrir entrada en nueva pestaña
      ["<C-p>"] = "actions.preview", -- Previsualizar entrada
      ["<C-c>"] = "actions.close", -- Cerrar oil.nvim
      ["<C-l>"] = "actions.refresh", -- Refrescar oil.nvim
      ["-"] = "actions.parent", -- Ir al directorio padre
      ["_"] = "actions.open_cwd", -- Abrir el directorio de trabajo actual
      ["`"] = "actions.cd", -- Cambiar de directorio
      ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd al directorio actual de oil" }, -- Cambiar directorio solo en la pestaña actual
      ["gs"] = "actions.change_sort", -- Cambiar el método de ordenamiento
      ["gx"] = "actions.open_external", -- Abrir la entrada con una aplicación externa
      ["g."] = "actions.toggle_hidden", -- Mostrar u ocultar archivos ocultos
      ["g\\"] = "actions.toggle_trash", -- Activar o desactivar la papelera
    },
    use_default_keymaps = false, -- No usar las asignaciones de teclas predeterminadas
  },

  -- Dependencias opcionales
  dependencies = {
    -- Plugin: nvim-web-devicons
    -- Descripción: Un fork de Lua de vim-web-devicons para Neovim.
    "nvim-tree/nvim-web-devicons",
  },
}
