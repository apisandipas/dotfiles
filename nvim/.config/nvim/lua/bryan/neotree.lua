local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
}

M.config = function()
  local icons = require("bryan.icons")
  require("neo-tree").setup({
    close_if_last_window = true,
    default_component_configs = {
      git_status = {
        symbols = {
          -- Change type
          added = icons.git.LineAdded,
          modified = icons.git.LineModified,
          deleted = "✖",
          renamed = icons.git.FileRenamed,
          -- Status type
          untracked = icons.git.FileUntracked,
          ignored = icons.git.FileIgnored,
          unstaged = icons.git.FileUnstaged,
          staged = icons.git.FileStaged,
          conflict = icons.git.FileConflict,
        },
      },
    },
    window = {
      width = 30,
    },
    buffers = {
      follow_current_file = true,
    },
    filesystem = {
      follow_current_file = true,
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          "node_modules",
        },
        never_show = {
          ".DS_Store",
          "thumbs.db",
        },
      },
    },
  })

  local wk = require("which-key")
  wk.register({
    e = { "<cmd>Neotree toggle=true<CR>", "Explorer" },
  }, { prefix = "<leader>" })
end

return M
