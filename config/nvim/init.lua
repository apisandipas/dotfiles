-- ██████   █████                              ███
-- ░██████ ░░███                              ░░░
-- ░███░███ ░███   ██████  ██████  █████ █████████ █████████████
-- ░███░░███░███  ███░░██████░░███░░███ ░░███░░███░░███░░███░░███
-- ░███ ░░██████ ░███████░███ ░███ ░███  ░███ ░███ ░███ ░███ ░███
-- ░███  ░░█████ ░███░░░ ░███ ░███ ░░███ ███  ░███ ░███ ░███ ░███
-- █████  ░░█████░░██████░░██████   ░░█████   ██████████░███ █████
--░░░░░    ░░░░░  ░░░░░░  ░░░░░░     ░░░░░   ░░░░░░░░░░ ░░░ ░░░░░

-- General Configs
require('bp.globals')
require('bp.settings')
require('bp.plugins')
require('bp.keymappings')
require('bp.autocommands')


-- Plugin Configs
require('bp.config.status-bar')
require('bp.config.comments')
require('bp.config.completions')
require('bp.config.search')
require('bp.config.explorer')
require('bp.config.autopairs')
require('bp.config.syntax')
require('bp.config.ui')
require('bp.config.keymap')


-- LSP Configs
require('bp.lsp')
require('bp.lsp.bash')
require('bp.lsp.css')
require('bp.lsp.docker')
require('bp.lsp.graphql')
require('bp.lsp.html')
require('bp.lsp.js-ts')
require('bp.lsp.json')

vim.cmd([[
	hi Normal guibg=NONE ctermbg=NONE
	hi Comment cterm=italic
]])


vim.cmd('source ~/.config/nvim/general/functions.vim')


