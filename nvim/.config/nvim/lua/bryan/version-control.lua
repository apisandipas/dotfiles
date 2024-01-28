local M = {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
        },
      })
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("neogit").setup({})
      local wk = require("which-key")

      wk.register({
        g = {
          name = "+git",
          g = { "<cmd>Neogit<CR>", "Neogit" },
          p = { "<cmd>Neogit push<CR>", "Git push" },
          P = { "<cmd>Neogit pull<CR>", "Git pull" },
          b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle inline blame" },
        },
      }, { prefix = "<leader>" })
    end,
  },
  -- {
  --   "braxtons12/blame_line.nvim",
  --   config = true,
  -- },
}

return M
