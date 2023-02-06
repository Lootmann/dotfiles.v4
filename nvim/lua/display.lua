-------------------------------------------------
-- lua/display.lua
-------------------------------------------------
local cmd = vim.cmd
local opt = vim.opt

vim.wo.cursorline = true

cmd([[
au ColorScheme * hi Normal       ctermbg=none guibg=none
au ColorScheme * hi NonText      ctermbg=none guibg=none
au ColorScheme * hi LineNr       ctermbg=none guibg=none
au ColorScheme * hi Folded       ctermbg=none guibg=nonecmd
au ColorScheme * hi EndOfBuffer  ctermbg=none guibg=nonecmd
au ColorScheme * hi CursorLine   ctermbg=none guibg=#151515 guifg=none
au ColorScheme * hi CursorLineNr ctermbg=none guibg=none    guifg=#FFB52E
]])

-- transparency
opt.winblend = 30
opt.pumblend = 15
opt.termguicolors = true

-- color scheme
vim.o.background = "dark"
cmd("colorscheme kanagawa")

--[[
cur:
  afterglow ayu edge kanagawa onedark onedark_dark
  sonokai spacegray zephyr
  gruvbox8 gruvbox-baby kimbox melange

nah:
  apprentice carbonfox catppuccin dawn duskfox iceberg jellybeans
  juliana lighthaus moonfly nightfly nightfox nordfox palenightfall
  sherbet srcery terafox tokyonight
--]]
