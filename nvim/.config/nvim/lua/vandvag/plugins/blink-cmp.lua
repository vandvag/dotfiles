return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    "nvim-mini/mini.nvim",
  },

  version = '1.*',
  opts = {
    keymap = { preset = 'enter' },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },

    completion = {
      documentation = { auto_show = true },
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    signature = { enabled = true },

    fuzzy = {
      implementation = "prefer_rust_with_warning",
      sorts = {
        'exact',
        'score',
        'sort_text'
      }
    }
  },
  opts_extend = { "sources.default" }
}
