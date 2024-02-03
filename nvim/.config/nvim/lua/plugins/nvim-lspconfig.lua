return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function(ev)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")
    local util = lspconfig.util

    local function root_pattern_excludes(opt)
      local root = opt.root
      local exclude = opt.exclude

      local function matches(path, pattern)
        return 0 < #vim.fn.glob(util.path.join(path, pattern))
      end

      return function(startpath)
        local foundWanted = false
        local foundUnwanted = false
        return util.search_ancestors(startpath, function(path)
          if foundWanted then
            return true
          end

          if foundUnwanted then
            return false
          end

          foundWanted = matches(path, root)
          foundUnwanted = matches(path, exclude)
        end)
      end
    end

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
    })

    lspconfig.html.setup({
      capabilities = capabilities,
    })

    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      root_dir = root_pattern_excludes({
        root = "package.json",
        exclude = "deno.json",
      }),
      single_file_support = false,
    })

    lspconfig.denols.setup({
      capabilities = capabilities,
      root_dir = root_pattern_excludes({
        root = "deno.json",
        exclude = "package.json",
      }),
      settings = {
        deno = {
          config = "ged/deno.json",
        },
      },
      single_file_support = false,
    })

    lspconfig.dprint.setup({
      capabilities = capabilities,
      root_dir = root_pattern_excludes({
        root = "deno.json",
        exclude = "package.json",
      }),
      single_file_support = false,
    })

    lspconfig.cssls.setup({
      capabilities = capabilities,
    })

    lspconfig.biome.setup({
      capabilities = capabilities,
      cmd = { "biome", "lsp-proxy" },
      filetypes = {
        "javascript",
        "javascript.jsx",
        "javascriptreact",
        "json",
        "jsonc",
        "typescript",
        "typescript.tsx",
        "typescriptreact",
      },
      single_file_support = true,
    })

    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "<leader>gf", function()
      vim.lsp.buf.format({ async = false })
    end, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
  end,
}
