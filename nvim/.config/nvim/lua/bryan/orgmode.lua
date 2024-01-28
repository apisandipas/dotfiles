local M = {
  "nvim-orgmode/orgmode",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter", lazy = true },
    "akinsho/org-bullets.nvim",
    { "lukas-reineke/headlines.nvim", config = true },
  },
  event = "VeryLazy",
}

M.config = function()
  -- Load treesitter grammar for org
  require("orgmode").setup_ts_grammar()
  --
  -- Setup orgmode
  require("orgmode").setup({
    org_agenda_files = "~/Dropbox/org/**/*",
    org_default_notes_file = "~/Dropbox/org/inbox.org",
  })

  require("org-bullets").setup({
    concealcursor = false, -- If false then when the cursor is on a line underlying characters are visible
    symbols = {
      -- list symbol
      list = "•",
      -- headlines can be a list
      headlines = { "◉", "○", "✸", "✿" },
      -- or a function that receives the defaults and returns a list
      checkboxes = {
        half = { "", "OrgTSCheckboxHalfChecked" },
        done = { "✓", "OrgDone" },
        todo = { "˟", "OrgTODO" },
      },
    },
  })
end

return M
