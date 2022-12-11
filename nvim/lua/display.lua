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
cmd("colorscheme iceberg")

--[[
-- cool
afterglow apprentice ayu ayu-dark
dawn iceberg jellybeans moonfly
nightfly onedarkpro onenord
one_monokai spaceduck spacegray

-- warm
gruvbox gruvbox-baby gruvbox8 kimbox srcery

-- nah
boo everblush doom-one kanagawa minimal
nightfox tender tokyodark tokyonight
vim.g.terminal_color_15 = 1 vim-monokai-tasty zephyr

-- unsupported tree-sitter
melange sonokai juliana
--]]
