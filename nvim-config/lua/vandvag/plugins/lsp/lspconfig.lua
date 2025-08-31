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
      clangd = {
        cmd = {
          "clangd",
          "--clang-tidy",
          "-j=5",
          "--fallback-style=goole",
        },
        filetypes = { "c", "h", "h.c", "hpp", "cpp" },
      },
      pyright = {},
      zls = {},
      gopls = {},
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "Snacks", "MiniFiles", "MiniPick" },
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

    local on_attach = function(client, bufnr)
      local additional_opts = { buffer = bufnr }
      noremap('n', 'gD', ":lua vim.lsp.buf.declarations()<cr>", "Go to declaration", additional_opts)
      noremap('n', 'gd', ":lua vim.lsp.buf.definition()<cr>", "Go to definition", additional_opts)
      noremap("n", '<leader>e', function() vim.diagnostic.open_float() end, "Show diagnostics for line", additional_opts)

      if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true)
      end

      if client.server_capabilities.hoverProvider then
        noremap('n', 'K', function() vim.lsp.buf.hover() end, "Get hover info", additional_opts)
      end
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
