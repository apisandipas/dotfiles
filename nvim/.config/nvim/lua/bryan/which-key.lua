local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

M.init = function()
  vim.o.timeout = true
  vim.o.timeoutlen = 500
end

M.config = function()
  local wk = require("which-key")
  wk.register({
    q = { "<cmd>confirm q<CR>", "Quit" },
    h = { "<cmd>nohlsearch<CR>", "NOHL" },
    b = {
      name = "+buffers",
      a = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "List Buffers" },
      w = { "<cmd>w<cr>", "Write Buffer" },
      d = { "<cmd>bd<cr>", "Delete Buffer" },
      n = { "<cmd>bn<cr>", "Next Buffer" },
      p = { "<cmd>bp<cr>", "Prev Buffer" },
    },
    e = { name = "+file explorer" },
    f = { name = "+files" },
    g = { name = "+git" },
    m = { name = "+marks" },
    o = { name = "+org" },
    s = { name = "+splits" },
    t = { name = "+tabs" },
    w = { name = "+sessions" },
  }, { prefix = "<leader>" })
end

return M
