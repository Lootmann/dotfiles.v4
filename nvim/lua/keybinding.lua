-------------------------------------------------
-- lua/keybinding.lua
-------------------------------------------------

-- base
vim.g.mapleader = " "

Imap("jk", "<ESC>")
Nmap("<Leader>w", ":w<CR>")
Nmap("<Leader>q", ":q<CR>")
Nmap("<ESC><ESC>", ":nohl<CR>")
