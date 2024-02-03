return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      sources = {
        null_ls.builtins.completion.luasnip,

        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.dprint,
        -- null_ls.builtins.formatting.deno_fmt,

        null_ls.builtins.formatting.biome,
        -- null_ls.builtins.diagnostics.biome,
        -- null_ls.builtins.diagnostics.deno_lint,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })

    -- vim.keymap.set("n", "gp", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "gn", vim.diagnostic.goto_next)
    vim.keymap.set("n", "gl", vim.diagnostic.open_float)
  end,
}
