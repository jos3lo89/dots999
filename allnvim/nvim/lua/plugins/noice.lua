return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    cmdline = {
      view = "cmdline",
    },
    presets = {

      bottom_search = true, -- Activa la búsqueda en la parte inferior
      command_palette = true, -- Habilita la command palette
      lsp_doc_border = true, -- Añade bordes a la documentación LSP
    },
    --       -- Uncomment the following lines to customize the cmdline popup view
    --       -- views = {
    --       --   cmdline_popup = {
    --       --     filter_options = {},
    --       --     win_options = {
    --       --       winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
    --       --     },
    --       --   },
    --       -- },
  },
}
