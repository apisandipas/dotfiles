local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "folke/neodev.nvim",
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
}

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap

  opts.desc = "Code Actions"
  keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  opts.desc = "Defintions"
  keymap(bufnr, "n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", opts)
  opts.desc = "Info"
  keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<CR>", opts)
  opts.desc = "Next Diagnostic"
  keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  opts.desc = "Prev Diagnostic"
  keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  opts.desc = "CodeLens"
  keymap(bufnr, "n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<CR>", opts)
  opts.desc = "Quickfix"
  keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  opts.desc = "Peek"
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)

  if client.supports_method("textDocument/inlayHint") then
    vim.lsp.inlay_hint.enable(bufnr, true)
  end
end

M.toggle_inlay_hints = function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled(bufnr))
end

M.common_capabilities = function()
  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  return cmp_nvim_lsp.default_capabilities()
end

function M.config()
  local wk = require("which-key")
  wk.register({ l = { name = "+lsp" } }, { prefix = "<leader>" })

  wk.register({
    ["<F2>"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    ["<F12>"] = { "<cmd>Telescope lsp_references<cr>", "Show references" },
  })

  local lspconfig = require("lspconfig")
  local icons = require("bryan.icons")

  local servers = {
    "lua_ls",
    "cssls",
    "html",
    -- "tsserver",
    "bashls",
    "jsonls",
    "yamlls",
    -- "tailwindcss",
    "eslint",
    -- "prismals",
  }

  local default_diagnostic_config = {
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
        { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
        { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
      },
    },
    virtual_text = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(default_diagnostic_config)

  for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  require("lspconfig.ui.windows").default_options.border = "rounded"

  for _, server in pairs(servers) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    }

    local require_ok, settings = pcall(require, "bryan.lsp-settings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    if server == "lua_ls" then
      require("neodev").setup({})
    end

    lspconfig[server].setup(opts)
  end
end

return M
