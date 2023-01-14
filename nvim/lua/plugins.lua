------------------------------------------------
-- lua/plugins.lua
------------------------------------------------

-- auto Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

-- install packages
require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"j-hui/fidget.nvim",
			"folke/neodev.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			--"lithammer/nvim-diagnosticls",
		},
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"dcampos/nvim-snippy",
			"dcampos/cmp-snippy",
		},
	})

	-- formatter
	use("mhartington/formatter.nvim")

	-- util
	use("kyazdani42/nvim-web-devicons")
	use("windwp/nvim-ts-autotag")
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- finder
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-lua/plenary.nvim",
		},
	})
	use("junegunn/fzf")

	-- filer: https://github.com/lambdalisue/fern.vim
	use({
		"lambdalisue/fern.vim",
		requires = {
			"antoinemadec/FixCursorHold.nvim",
			"lambdalisue/nerdfont.vim",
			"lambdalisue/glyph-palette.vim",
			"lambdalisue/fern-renderer-nerdfont.vim",
			"lambdalisue/fern-git-status.vim",
		},
	})

	-- other
	use("terrortylor/nvim-comment")
	use("pedro757/emmet")
	use("lewis6991/gitsigns.nvim")
	use("easymotion/vim-easymotion")

	-- color scheme
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({ "CrispyBaccoon/dawn.vim" })
	use({ "EdenEast/nightfox.nvim" })
	use({ "Shatur/neovim-ayu" })
	use({ "ackyshake/Spacegray.vim" })
	use({ "adisen99/apprentice.nvim", requires = { "rktjmp/lush.nvim" } })
	use({ "aonemd/kuroi.vim" })
	use({ "bluz71/vim-moonfly-colors" })
	use({ "bluz71/vim-nightfly-guicolors" })
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "cocopon/iceberg.vim" })
	use({ "cpea2506/one_monokai.nvim" })
	use({ "danilo-augusto/vim-afterglow" })
	use({ "ellisonleao/gruvbox.nvim" })
	use({ "folke/tokyonight.nvim" })
	use({ "glepnir/zephyr-nvim", requires = { "nvim-treesitter/nvim-treesitter", opt = true } })
	use({ "kaiuri/nvim-juliana" })
	use({ "lifepillar/vim-gruvbox8" })
	use({ "lmburns/kimbox" })
	use({ "luisiacc/gruvbox-baby" })
	use({ "nanotech/jellybeans.vim" })
	use({ "olimorris/onedarkpro.nvim" })
	use({ "rebelot/kanagawa.nvim" })
	use({ "rmehri01/onenord.nvim" })
	use({ "savq/melange" })
	use({ "srcery-colors/srcery-vim", as = "srcery" })
	use({ "mcchrish/zenbones.nvim", requires = "rktjmp/lush.nvim" })
	use({ "sainnhe/edge" })
	use({ "rktjmp/lush.nvim" })
	use({ "lewpoly/sherbet.nvim" })
	use({ "lighthaus-theme/vim-lighthaus" })
	use({ "JoosepAlviste/palenightfall.nvim" })
end)

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
