-- Config for Color Code Highlighting
require('colorizer').setup(
  {'*';},
  {
    RGB      = true;         -- #RGB hex codes
	  RRGGBB   = true;         -- #RRGGBB hex codes
	  -- names    = true;         -- "Name" codes like Blue
	  RRGGBBAA = true;         -- #RRGGBBAA hex codes
	  rgb_fn   = true;         -- CSS rgb() and rgba() functions
	  hsl_fn   = true;         -- CSS hsl() and hsla() functions
	  css      = true;         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	  css_fn   = true;         -- Enable all CSS *functions*: rgb_fn, hsl_fn
  })

  -- Cnfig for Buffer Tab bar navigation
  vim.api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<S-x>', ':BufferClose<CR>', { noremap = true, silent = true })

vim.g.dashboard_custom_header = {

"==================================================================================================",
"===============  =====  =======================================  ==============================  =",
"===============  =====  =======================================  ==============================  =",
"===============  =====  =======================================  ==================  ==========  =",
"==   ====   ===  =====  ===   ====   ====   ===  =   ==========  ==  ===   ===  ==    ===   ===  =",
"=  =  ==  =  ==    ===  ==  =  ==  =  ==  =  ==    =  =======    ======  =  =======  ===  =  ==  =",
"=  ========  ==  =  ==  ==     ==  ========  ==  ===========  =  ==  ===    ==  ===  ======  ==  =",
"=  ======    ==  =  ==  ==  =====  ======    ==  ===========  =  ==  =====  ==  ===  ====    ==  =",
"=  =  ==  =  ==  =  ==  ==  =  ==  =  ==  =  ==  =======  ==  =  ==  ==  =  ==  ===  ===  =  ==  =",
"==   ====    ==    ===  ===   ====   ====    ==  =======  ===    ==  ===   ===  ===   ===    ==  =",
"=================================================================================================="

}

-- vim.g.dashboard_custom_header = {
-- "                    █████     ████                                               █████  ███            ███   █████              ████",
-- "                   ░░███     ░░███                                              ░░███  ░░░            ░░░   ░░███              ░░███",
-- "  ██████   ██████   ░███████  ░███   ██████   ██████   ██████   ████████      ███████  ████   ███████ ████  ███████    ██████   ░███",
-- " ███░░███ ░░░░░███  ░███░░███ ░███  ███░░███ ███░░███ ░░░░░███ ░░███░░███    ███░░███ ░░███  ███░░███░░███ ░░░███░    ░░░░░███  ░███",
-- "░███ ░░░   ███████  ░███ ░███ ░███ ░███████ ░███ ░░░   ███████  ░███ ░░░    ░███ ░███  ░███ ░███ ░███ ░███   ░███      ███████  ░███",
-- "░███  ███ ███░░███  ░███ ░███ ░███ ░███░░░  ░███  ███ ███░░███  ░███        ░███ ░███  ░███ ░███ ░███ ░███   ░███ ███ ███░░███  ░███",
-- "░░██████ ░░████████ ████████  █████░░██████ ░░██████ ░░████████ █████     ██░░████████ █████░░███████ █████  ░░█████ ░░████████ █████",
-- " ░░░░░░   ░░░░░░░░ ░░░░░░░░  ░░░░░  ░░░░░░   ░░░░░░   ░░░░░░░░ ░░░░░     ░░  ░░░░░░░░ ░░░░░  ░░░░░███░░░░░    ░░░░░   ░░░░░░░░ ░░░░░",
-- "                                                                                             ███ ░███",
-- "                                                                                            ░░██████",
-- "                                                                                             ░░░░░░"
-- }

vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
    a = {description = {'  Find File          '}, command = 'Telescope find_files'},
    b = {description = {'  Recently Used Files'}, command = 'Telescope oldfiles'},
    c = {description = {'  Load Last Session  '}, command = 'SessionLoad'},
    d = {description = {'  Find Word          '}, command = 'Telescope live_grep'},
    e = {description = {'  Settings           '}, command = ':e ~/.config/nvim/init.lua'}
    -- e = {description = {'  Marks              '}, command = 'Telescope marks'}
}

-- TODO Read these quotes from the file system maybe?
local techQuotesTable = {
	"Technology is anything that wasn’t around when you were born. - Alan Kay",
	"“C is quirky, flawed, and an enormous success.” ― Dennis M. Ritchie",
	"Any sufficiently advanced technology is equivalent to magic. - Arthur C. Clarke",
	"Just because something doesn’t do what you planned it to do doesn’t mean it’s useless. - Thomas Edison",
	"It has become appallingly obvious that our technology has exceeded our humanity. - Albert Einstein",
	"Computers are useless.  They can only give you answers. - Pablo Picasso",
	"Technology is a word that describes something that doesn’t work yet. - Douglas Adams",

}

-- Grab a random quote for Dashboard footer
vim.g.dashboard_custom_footer = { techQuotesTable[ math.random( #techQuotesTable ) ] }


-- Config for Git Signs in left colnbs
require('gitsigns').setup {
	signs = {
	  -- TODO add hl to colorscheme
	  add          = {hl = 'GitSignsAdd'   , text = '▎', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
	  change       = {hl = 'GitSignsChange', text = '▎', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
	  delete       = {hl = 'GitSignsDelete', text = '契', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
	  topdelete    = {hl = 'GitSignsDelete', text = '契', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
	  changedelete = {hl = 'GitSignsChange', text = '▎', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
	},
	numhl = false,
	linehl = false,
	keymaps = {
	  -- Default keymap options
	  noremap = true,
	  buffer = true,
	},
	watch_index = {
	  interval = 1000
	},
	sign_priority = 6,
	update_debounce = 200,
	status_formatter = nil, -- Use default
	use_decoration_api = false
  }

