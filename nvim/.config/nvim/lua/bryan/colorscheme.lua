local M = {
  "rose-pine/neovim",
  priority = 1000,
  name = "rose-pine",
}

M.config = function()
  -- load the colorscheme here
  vim.cmd([[colorscheme rose-pine-moon]])
  vim.cmd([[
    highlight Normal guibg=none
    highlight NonText guibg=none
    highlight Normal ctermbg=none
    highlight NonText ctermbg=none
  ]])

  require("rose-pine").setup({
    variant = "moon", -- auto, main, moon, or dawn
    dark_variant = "moon", -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    styles = {
      bold = true,
      italic = true,
      transparency = true,
    },

    groups = {
      border = "muted",
      link = "iris",
      panel = "surface",

      error = "love",
      hint = "iris",
      info = "foam",
      warn = "gold",

      git_add = "foam",
      git_change = "rose",
      git_delete = "love",
      git_dirty = "rose",
      git_ignore = "muted",
      git_merge = "iris",
      git_rename = "pine",
      git_stage = "iris",
      git_text = "rose",
      git_untracked = "subtle",

      headings = {
        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
      },
      -- Alternatively, set all headings at once.
      -- headings = "subtle",
    },
  })
end

return M
