local M = {
  "nvim-treesitter/nvim-treesitter",
  -- event = { "BufReadPost", "BufNewFile" },
  -- build = ":TSUpdate",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      -- event = "VeryLazy",
    },
  },
}

function M.config()
  local wk = require("which-key")
  wk.register({
    ["<leader>Ti"] = { "<cmd>TSConfigInfo<CR>", "Info" },
  })

  require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "org" }, -- put the language you want in this array
    ignore_install = { "" },
    sync_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { "org" },
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<c-space>",
        node_incremental = "<c-space>",
        scope_incremental = "<c-s>",
        node_decremental = "<c-b>",
      },
    },
    auto_install = true,
    modules = {},
    indent = {
      enable = true,
      disable = { "yaml" },
    },
    autopairs = { enable = true },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
    },
  })
end

return M
