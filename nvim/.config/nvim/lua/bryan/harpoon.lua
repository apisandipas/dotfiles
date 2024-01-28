local M = {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

M.config = function()
  -- set keymaps
  local wk = require("which-key")
  wk.register({
    mm = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Mark file with Harpoon" },
    mn = { "<cmd>lua require('harpoon.mark').nav_next()<cr>", "Go to next Harpoon mark" },
    mp = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Goto prev Harpoon mark" },
    ma = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Mark file with Harpoon" },
  }, { prefix = "<leader>" })
end

return M
