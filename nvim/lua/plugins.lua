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
	"mhartington/formatter.nvim",
	"kyazdani42/nvim-web-devicons",
	"windwp/nvim-ts-autotag",
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
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
	-- "junegunn/fzf",

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
	"vimwiki/vimwiki",

	-- colorscheme
	{ "nvim-treesitter/nvim-treesitter", after = ":TSUpdate" },
	{ "adisen99/apprentice.nvim", dependencies = { "rktjmp/lush.nvim" } },
	{ "catppuccin/nvim", as = "catppuccin" },
	{ "glepnir/zephyr-nvim", dependencies = { "nvim-treesitter/nvim-treesitter", opt = true } },
	{ "srcery-colors/srcery-vim", as = "srcery" },
	{ "mcchrish/zenbones.nvim", dependencies = "rktjmp/lush.nvim" },
	"CrispyBaccoon/dawn.vim",
	"EdenEast/nightfox.nvim",
	"Shatur/neovim-ayu",
	"ackyshake/Spacegray.vim",
	"aonemd/kuroi.vim",
	"bluz71/vim-moonfly-colors",
	"bluz71/vim-nightfly-guicolors",
	"cocopon/iceberg.vim",
	"cpea2506/one_monokai.nvim",
	"danilo-augusto/vim-afterglow",
	"ellisonleao/gruvbox.nvim",
	"folke/tokyonight.nvim",
	"kaiuri/nvim-juliana",
	"lifepillar/vim-gruvbox8",
	"lmburns/kimbox",
	"luisiacc/gruvbox-baby",
	"nanotech/jellybeans.vim",
	"olimorris/onedarkpro.nvim",
	"rebelot/kanagawa.nvim",
	"rmehri01/onenord.nvim",
	"savq/melange",
	"sainnhe/edge",
	"rktjmp/lush.nvim",
	"lewpoly/sherbet.nvim",
	"lighthaus-theme/vim-lighthaus",
	"JoosepAlviste/palenightfall.nvim",
})

-- LSP Sever management
require("rc.mason")
require("rc.nvim-lspconfig")
require("rc.cmp")
require("rc.diagnostic")

-- Package RCs
require("rc.treesitter")
require("rc.emmet_ls")
require("rc.formatter")
require("rc.fern")
require("rc.nvim-comment")
require("rc.telescope")
require("rc.gitsigns")
require("rc.snippy")
require("rc.lualine")
require("rc.autotag")
require("rc.autopairs")
