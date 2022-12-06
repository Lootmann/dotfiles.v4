-------------------------------------------------
-- rc/fern.lua
-------------------------------------------------

local cmd = vim.cmd

cmd([[ let g:fern#renderer = "nerdfont" ]])

cmd([[
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
augroup END
]])

Nmap("<leader>d", "<cmd>Fern . -drawer -toggle<CR>")

cmd([[
let g:fern#default_hidden = 1
let g:fern#disable_default_mappings = 1

function! FernInit() abort
  nmap <buffer> l <Plug>(fern-action-open-or-expand)
  nmap <buffer> o <Plug>(fern-action-open-or-expand)
  nmap <buffer> <Enter> <Plug>(fern-action-open)
  nmap <buffer> H <Plug>(fern-action-leave)

  nmap <buffer> c <Plug>(fern-action-copy)
  nmap <buffer> m <Plug>(fern-action-move)

  nmap <buffer> C <Plug>(fern-action-clipboard-copy)
  nmap <buffer> M <Plug>(fern-action-clipboard-move)
  nmap <buffer> P <Plug>(fern-action-clipboard-paste)

  nmap <buffer> N <Plug>(fern-action-new-file)
  nmap <buffer> K <Plug>(fern-action-new-dir)
  nmap <buffer> R <Plug>(fern-action-rename)
  nmap <buffer> D <Plug>(fern-action-remove)

  nmap <buffer> <C-r> <Plug>(fern-action-reload)
  nmap <buffer> . <Plug>(fern-action-hidden:toggle)
endfunction

augroup FernEvents
  autocmd!
  autocmd FileType fern call FernInit()
augroup END
]])
