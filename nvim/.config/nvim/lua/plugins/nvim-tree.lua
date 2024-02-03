return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	config = function()
		require("nvim-tree").setup({
			git = {
				ignore = false,
			},
			filters = {
				dotfiles = false,
			},
			update_focused_file = {
				enable = true,
			},
			view = {
				adaptive_size = true,
			},
		})

		vim.keymap.set("n", "<leader>o", "<Cmd>NvimTreeFocus<CR>", {})
		vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", {})
	end,
}
