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

-- with tmux
cmd("autocmd BufReadPost,FileReadPost,BufNewFile * call system('tmux rename-window ' . expand('%'))")
cmd("autocmd VimLeave * call system('tmux rename-window zsh')")

-- color scheme
vim.o.background = "dark"
cmd("colorscheme ayu")

--[[
cool:
  apprentice dawn iceberg jellybeans
pale:
  kanagawa onenord sherbet
vivid:
  afterglow carbonfox catppuccin duskfox juliana
  nightfox one_monokai onedark onedark_dark nordfox
  palenightfall spacegray srcery terafox tokyonight
  zephyr
warm:
  ayu ayu-dark ayu-mirage gruvbox gruvbox-baby gruvbox8 kimbox melange
nah:
  moonfly nightfly **-bones lighthaus
--]]
