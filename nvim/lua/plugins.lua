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
			--"lithammer/nvim-diagnosticls",
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
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-lua/plenary.nvim",
		},
	},
	"junegunn/fzf",
	{
		"lambdalisue/fern.vim",
		dependencies = {
			"antoinemadec/FixCursorHold.nvim",
			"lambdalisue/nerdfont.vim",
			"lambdalisue/glyph-palette.vim",
			"lambdalisue/fern-renderer-nerdfont.vim",
			"lambdalisue/fern-git-status.vim",
		},
	},
	"terrortylor/nvim-comment",
	"pedro757/emmet",
	"lewis6991/gitsigns.nvim",
	"easymotion/vim-easymotion",
	{
		"nvim-treesitter/nvim-treesitter",
		after = ":TSUpdate",
	},
	{ "CrispyBaccoon/dawn.vim" },
	{ "EdenEast/nightfox.nvim" },
	{ "Shatur/neovim-ayu" },
	{ "ackyshake/Spacegray.vim" },
	{ "adisen99/apprentice.nvim", dependencies = { "rktjmp/lush.nvim" } },
	{ "aonemd/kuroi.vim" },
	{ "bluz71/vim-moonfly-colors" },
	{ "bluz71/vim-nightfly-guicolors" },
	{ "catppuccin/nvim", as = "catppuccin" },
	{ "cocopon/iceberg.vim" },
	{ "cpea2506/one_monokai.nvim" },
	{ "danilo-augusto/vim-afterglow" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "folke/tokyonight.nvim" },
	{ "glepnir/zephyr-nvim", dependencies = { "nvim-treesitter/nvim-treesitter", opt = true } },
	{ "kaiuri/nvim-juliana" },
	{ "lifepillar/vim-gruvbox8" },
	{ "lmburns/kimbox" },
	{ "luisiacc/gruvbox-baby" },
	{ "nanotech/jellybeans.vim" },
	{ "olimorris/onedarkpro.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "rmehri01/onenord.nvim" },
	{ "savq/melange" },
	{ "srcery-colors/srcery-vim", as = "srcery" },
	{ "mcchrish/zenbones.nvim", dependencies = "rktjmp/lush.nvim" },
	{ "sainnhe/edge" },
	{ "rktjmp/lush.nvim" },
	{ "lewpoly/sherbet.nvim" },
	{ "lighthaus-theme/vim-lighthaus" },
	{ "JoosepAlviste/palenightfall.nvim" },
})

-- LSP Sever management
require("rc.nvim-lspconfig")
require("rc.mason")
require("rc.lsp-settings.diagnostic")
require("rc.cmp")

-- Package RCs
require("rc.treesitter")
require("rc.easymotion")
require("rc.emmet_ls")
require("rc.feline")
require("rc.formatter")
require("rc.fern")
require("rc.nvim-comment")
require("rc.telescope")
require("rc.gitsigns")
require("rc.snippy")
require("rc.lualine")
require("rc.autotag")
require("rc.autopairs")
