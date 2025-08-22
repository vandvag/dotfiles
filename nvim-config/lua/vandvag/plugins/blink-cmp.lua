return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'echasnovski/mini.nvim',
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

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
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
