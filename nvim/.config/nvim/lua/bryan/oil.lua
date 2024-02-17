local M = {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

M.config = function()
  require("oil").setup({})
  local wk = require("which-key")

  wk.register({
    e = { "<cmd>lua require('oil').toggle_float()<CR>", "Explorer" },
  }, { prefix = "<leader>" })
end

return M
