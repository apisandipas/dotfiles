local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = LAZY_PLUGIN_SPEC,
  install = {
    colorscheme = { "nightfly" },
  },
  ui = {
    border = "rounded",
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

local wk = require("which-key")
wk.register({
  ["<leader>p"] = { name = "+plugins" },
  ["<leader>pi"] = { "<cmd>Lazy install<cr>", "Install" },
  ["<leader>ps"] = { "<cmd>Lazy sync<cr>", "Sync" },
  ["<leader>pS"] = { "<cmd>Lazy clear<cr>", "Status" },
  ["<leader>pc"] = { "<cmd>Lazy clean<cr>", "Clean" },
  ["<leader>pu"] = { "<cmd>Lazy update<cr>", "Update" },
  ["<leader>pp"] = { "<cmd>Lazy profile<cr>", "Profile" },
  ["<leader>pl"] = { "<cmd>Lazy log<cr>", "Log" },
  ["<leader>pd"] = { "<cmd>Lazy debug<cr>", "Debug" },
})
