local M = {
  "rmagatti/auto-session",
  lazy = true,
}

M.config = function()
  local auto_session = require("auto-session")

  auto_session.setup({
    auto_restore_enabled = false,
    auto_session_suppress_dirs = { "~/", "~/src/", "~/Downloads", "~/Documents", "~/Desktop/" },
  })

  local wk = require("which-key")
  wk.register({
    w = {
      r = { "<cmd>SessionRestore<cr>", "Restore session for cwd" },
      s = { "<cmd>SessionSave<cr>", "Save session for cwd" },
    },
  }, { prefix = "<leader>" })
end

return M
