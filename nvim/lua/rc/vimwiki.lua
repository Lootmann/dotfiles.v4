--[[
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'vimwiki', 'ext': '.wiki'}]
--]]

vim.cmd([[
let g:vimwiki_global_ext = 1

augroup VimWikiIndentation
  autocmd!
  autocmd BufNewFile,BufWinEnter,BufRead *.wiki :set ft=vimwiki syntax=vimwiki
  autocmd BufNewFile,BufWinEnter,BufRead *.wiki :setlocal shiftwidth=4 softtabstop=4 expandtab
augroup END
]])
