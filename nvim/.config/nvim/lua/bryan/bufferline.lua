local M = {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    sidebar_filetypes = {
      ["neo-tree"] = { event = "BufWipeout" },
    },
    animation = true,
  },
  version = "^1.0.0", -- optional: only update when a new 1.x version is released
}

M.init = function()
  vim.g.barbar_auto_setup = false
end

return M
