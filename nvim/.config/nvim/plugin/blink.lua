vim.pack.add({
  'https://github.com/saghen/blink.lib',
  'https://github.com/saghen/blink.cmp'
})

local cmp = require('blink.cmp')
cmp.build():wait(60000)

cmp.setup({
  keymap = { preset = "enter" },

  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = "mono",
  },

  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 700,
      window = {
        border = "rounded",
        scrollbar = false,
      },
    },

    list = {
      selection = {
        preselect = true,
        auto_insert = false,
      },
    },

    menu = {
      border = "rounded",
      scrollbar = false,
      draw = {
        padding = 0,
        columns = {
          { 'kind_icon' },
          { 'label' },
          { 'kind' },
          { 'source_with_parens' },
        },
        components = {
          source_with_parens = {
            text = function(ctx) return '(' .. ctx.source_name .. ')' end,
            highlight = 'BlinkCmpSource',
          },
        },
      },
    },
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },

  signature = {
    enabled = true,
  },

  fuzzy = {
    implementation = "prefer_rust_with_warning",
    sorts = {
      'exact',
      'score',
      'sort_text',
    },
  },

})
