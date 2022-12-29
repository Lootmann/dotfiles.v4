-------------------------------------------------
-- lua/display.lua
-------------------------------------------------

-- definitions
local cmd = vim.cmd
local opt = vim.opt

cmd("autocmd ColorScheme * highlight Normal ctermbg=none guibg=none")
cmd("autocmd ColorScheme * highlight NonText ctermbg=none guibg=none")
cmd("autocmd ColorScheme * highlight LineNr ctermbg=none guibg=none")
cmd("autocmd ColorScheme * highlight Folded ctermbg=none guibg=none")
cmd("autocmd ColorScheme * highlight EndOfBuffer ctermbg=none guibg=none")

vim.wo.cursorline = true
cmd("autocmd ColorScheme * highlight CursorLine ctermfg=none ctermbg=none cterm=none guibg=#1e1e1e guifg=none")
cmd("autocmd ColorScheme * highlight CursorLineNr ctermfg=none ctermbg=none cterm=none guibg=none guifg=#FFB52E")

-- transparency
opt.winblend = 15
opt.pumblend = 30
opt.termguicolors = true

-- color scheme
vim.o.background = "dark"
cmd("colorscheme juliana")

--[[
-- cool
afterglow apprentice ayu ayu-dark dawn iceberg
jellybeans kanagawa moonfly nightfly onenord
one_monokai spacegray onedark onedark_dark
onedark_vivid zephyr tokyonight
nightfox carbonfox terafox nordfox duskfox

-- warm
gruvbox gruvbox-baby gruvbox8 kimbox srcery

-- pale
melange

-- vivid
catppuccin juliana
--]]
