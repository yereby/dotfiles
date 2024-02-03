vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    { "<leader>wr", "<cmd>AutoSession search<CR>", desc = "Session search" },
    { "<leader>ws", "<cmd>AutoSession save<CR>",   desc = "Save session" },
    { "<leader>wa", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
  },
  opts = {
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    mappings = {
      -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
      delete_session = { "i", "<C-d>" },
      alternate_session = { "i", "<C-s>" },
      copy_session = { "i", "<C-y>" },
    },
    picker_opts = {
      border = true,
      layout_config = {
        width = 0.8, -- Can set width and height as percent of window
        height = 0.5,
      },

      preset = "dropdown",
      preview = false,
    },
    load_on_setup = true,
  },
}
