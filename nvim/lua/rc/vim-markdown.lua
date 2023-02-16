--[[
autocmd BufNewFile,BufWinEnter,BufRead *.md :set ft=markdown syntax=markdown
--]]

vim.cmd([[
augroup MarkdownSettings
  autocmd!
  autocmd Filetype markdown set ft=markdown syntax=markdown
  autocmd BufNewFile,BufWinEnter,BufRead *.md :set ft=markdown syntax=markdown
  autocmd BufNewFile,BufWinEnter,BufRead *.md :set conceallevel=0
augroup END

let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
]])
