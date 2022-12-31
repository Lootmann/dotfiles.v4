------------------------------------------------
-- lua/keybinding.lua
------------------------------------------------

-- install packages
require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("lithammer/nvim-diagnosticls")
	use("nvim-lua/plenary.nvim")

	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-buffer")
	use("dcampos/nvim-snippy")
	use("dcampos/cmp-snippy")
	use("pedro757/emmet")

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

	-- finder, searcher
	use("nvim-telescope/telescope.nvim")
	use("junegunn/fzf")
	use("nvim-telescope/telescope-file-browser.nvim")

	use("easymotion/vim-easymotion")
	use("lewis6991/gitsigns.nvim")

	-- filer: https://github.com/lambdalisue/fern.vim
	use({
		"lambdalisue/fern.vim",
		requires = { "antoinemadec/FixCursorHold.nvim" },
	})
	use("lambdalisue/nerdfont.vim")
	use("lambdalisue/glyph-palette.vim")
	use("lambdalisue/fern-renderer-nerdfont.vim")
	use("lambdalisue/fern-git-status.vim")

	-- commentout
	use("terrortylor/nvim-comment")

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
require("rc.mason")
require("rc.lsp-settings.diagnostic")
require("rc.cmp")
require("rc.langserver")

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
