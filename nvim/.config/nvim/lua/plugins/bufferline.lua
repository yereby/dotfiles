return {
	"akinsho/bufferline.nvim",
	config = function()
		local opts = {
			options = {
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " " or (e == "warning" and " " or "")
						s = s .. n .. sym
					end
					return s
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		}

		require("bufferline").setup(opts)
		-- Fix bufferline when restoring a session
		vim.api.nvim_create_autocmd("BufAdd", {
			callback = function()
				vim.schedule(function()
					pcall(nvim_bufferline)
				end)
			end,
		})

		vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", {})
		vim.keymap.set("n", "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", {})
		vim.keymap.set("n", "<leader>bc", "<Cmd>BufferLineCloseOthers<CR>", {})
		vim.keymap.set("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", {})
		vim.keymap.set("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", {})
	end,
}
