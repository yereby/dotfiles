local opts = {
  -- options = {
  -- theme = "catppuccin"
  -- }
  options = {
    theme = "auto",
    globalstatus = true,
    component_separators = { left = "|", right = "|" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "buffers" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "lsp_progess" },
    lualine_z = { "location" },
  },
  tabline = {},
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options ={
        globalstatus = true,
      }
    })
  end,
}
