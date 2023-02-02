-------------------------------------------------
-- lua/display.lua
-------------------------------------------------

-- definitions
local cmd = vim.cmd
local opt = vim.opt

cmd("au ColorScheme * hi Normal      ctermbg=none guibg=none")
cmd("au ColorScheme * hi NonText     ctermbg=none guibg=none")
cmd("au ColorScheme * hi LineNr      ctermbg=none guibg=none")
cmd("au ColorScheme * hi Folded      ctermbg=none guibg=none")
cmd("au ColorScheme * hi EndOfBuffer ctermbg=none guibg=none")

vim.wo.cursorline = true
cmd("au ColorScheme * hi CursorLine   ctermfg=none ctermbg=none cterm=none guibg=#0c0c0c guifg=none")
cmd("au ColorScheme * hi CursorLineNr ctermfg=none ctermbg=none cterm=none guibg=none    guifg=#ffffff")

-- transparency
opt.winblend = 30
opt.pumblend = 15
opt.termguicolors = true

-- color scheme
vim.o.background = "dark"
cmd("colorscheme ayu-dark")

--[[
chill:
  apprentice dawn iceberg spacegray tokyonight
pale:
  jellybeans kanagawa onenord terafox
vivid:
  afterglow carbonfox catppuccin duskfox juliana nightfox one_monokai
  onedark onedark_dark nordfox palenightfall srcery zephyr
warm:
  ayu ayu-dark ayu-mirage gruvbox gruvbox-baby gruvbox8 kimbox melange
nah:
  moonfly nightfly **-bones lighthaus sherbet
--]]
