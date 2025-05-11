return {
  {
    {
      "xiyaowong/transparent.nvim",
      config = function()
        require("transparent").setup({
          enable = true, -- boolean: enable transparent
          extra_groups = { -- table/string: additional groups that should be cleared
            "Normal",
            "NormalNC",
            "Comment",
            "Constant",
            "Special",
            "Identifier",
            "Statement",
            "PreProc",
            "Type",
            "Underlined",
            "Todo",
            "String",
            "Function",
            "Conditional",
            "Repeat",
            "Operator",
            "Structure",
            "LineNr",
            "NonText",
            "SignColumn",
            "CursorLineNr",
            "EndOfBuffer",
          },
          exclude = {}, -- table: groups you don't want to clear
        })
        vim.cmd("TransparentEnable") -- execute the command to enable transparency
      end,
    },
    {
      "dgox16/oldworld.nvim",
      name = "oldworld",
      lazy = false,
      priority = 1000,
      opts = {
        variant = "oled",
      },
    },
    {
      "morhetz/gruvbox",
      name = "gruvbox",
      lazy = false, -- Cargar inmediatamente
      priority = 1000, -- Asegurar que se cargue antes que otros plugins
    },
    {
      "rose-pine/neovim",
      name = "rose-pine",
      lazy = false,
      priority = 1000,
    },
    {
      "neanias/everforest-nvim",
      name = "everforest",
      lazy = false,
      priority = 1000,
      opts = {
        transparent_background = true,
      },
    },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "everforest",
        everforest_background = "hard",
      },
    },
  },
}
