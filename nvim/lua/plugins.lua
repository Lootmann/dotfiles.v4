------------------------------------------------
-- lua/plugins.lua
------------------------------------------------

-- install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- require for lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- install packages
require("lazy").setup({
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"j-hui/fidget.nvim",
			"folke/neodev.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"lithammer/nvim-diagnosticls",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"dcampos/nvim-snippy",
			"dcampos/cmp-snippy",
		},
	},
	"kyazdani42/nvim-web-devicons",
	{
		"windwp/nvim-ts-autotag",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter.configs").setup({
				autotag = { enable = true },
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "TelescopePrompt", "vim" },
			})
		end,
	},

    { -- formatter
		"jose-elias-alvarez/null-ls.nvim",
    },
	{ -- status line
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
	},
	{ -- finder
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-lua/plenary.nvim",
			"xiyaowong/telescope-emoji.nvim",
		},
	},

	{ -- filer
		"lambdalisue/fern.vim",
		dependencies = {
			"antoinemadec/FixCursorHold.nvim",
			"lambdalisue/nerdfont.vim",
			"lambdalisue/glyph-palette.vim",
			"lambdalisue/fern-renderer-nerdfont.vim",
			"lambdalisue/fern-git-status.vim",
		},
	},

	-- specify languages
	{
		"simrat39/rust-tools.nvim",
		config = function()
			require("rust-tools").setup({})
		end,
	},

	-- utils
	"terrortylor/nvim-comment",
	"pedro757/emmet",
	"lewis6991/gitsigns.nvim",
	{
		"ggandor/leap.nvim",
		dependencies = { "tpope/vim-repeat" },
		keys = { "s", "S" },
		config = function()
			local leap = require("leap")
			leap.set_default_keymaps()
		end,
	},
	"preservim/vim-markdown",

	-- colorscheme
	{ "nvim-treesitter/nvim-treesitter", after = ":TSUpdate" },
	"danilo-augusto/vim-afterglow",
	"Shatur/neovim-ayu",
	"sainnhe/edge",
	"rebelot/kanagawa.nvim",
	"cpea2506/one_monokai.nvim",
	"olimorris/onedarkpro.nvim",
	"sainnhe/sonokai",
	{ "glepnir/zephyr-nvim", dependencies = { "nvim-treesitter/nvim-treesitter", opt = true } },
	"sainnhe/gruvbox-material",
	"lmburns/kimbox",
	"savq/melange",
})

-- LSP Sever management
require("rc.mason")
require("rc.nvim-lspconfig")
require("rc.cmp")
require("rc.diagnostic")

-- Package RCs
require("rc.treesitter")
require("rc.emmet_ls")
require("rc.fern")
require("rc.nvim-comment")
require("rc.telescope")
require("rc.gitsigns")
require("rc.snippy")
require("rc.lualine")
require("rc.vim-markdown")
require("rc.null_ls")
