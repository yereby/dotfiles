return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
    lazy = false,
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "elixir",
          "heex",
          "javascript",
          "html",
          "typescript",
        },
				auto_install = true,
        autotag = {
          enable = true,
        },
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
