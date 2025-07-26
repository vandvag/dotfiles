return {
  "neovim/nvim-lspconfig",
  dependencies = {
    'saghen/blink.cmp',
  },
  opts = {
    servers = {
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy"
            }
          }
        }
      },
      clangd = {},
      pyright = {},
      zls = {},
      gopls = {},
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "Snacks", "MiniFiles" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      },
    }
  },

  config = function(_, opts)
    local lspconfig = require("lspconfig")
    local noremap = require("vandvag.core.utils").noremap

    local on_attach = function(_, bufnr)
      local additional_opts = { buffer = bufnr }
      noremap('n', 'gD', ":lua vim.lsp.buf.declarations()<cr>", "Go to declaration", additional_opts)
      noremap('n', 'gd', ":lua vim.lsp.buf.definition()<cr>", "Go to definition", additional_opts)
      noremap("n", '<leader>e', function() vim.diagnostic.open_float() end, "Show diagnostics for line", additional_opts)
    end

    vim.diagnostic.config({
      virtual_lines = false,
      virtual_text = true
    })


    for server, config in pairs(opts.servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      config.on_attach = on_attach
      lspconfig[server].setup(config)
    end
  end
}
