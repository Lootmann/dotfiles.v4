vim.cmd([[
augroup VimWikiIndentation
  autocmd!
  autocmd FileType vimwiki setlocal shiftwidth=3 softtabstop=3 expandtab
augroup END
]])
