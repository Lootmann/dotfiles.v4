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

	-- use("jose-elias-alvarez/null-ls.nvim")
	use("mhartington/formatter.nvim") -- new formatter

	use("easymotion/vim-easymotion")
	use("lewis6991/gitsigns.nvim")
	use({
		"glepnir/galaxyline.nvim",
		branch = "main",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	}) -- statusline

	use("SmiteshP/nvim-gps")
	use("mfussenegger/nvim-dap")
	use("kyazdani42/nvim-web-devicons")
	use("themercorp/themer.lua")
	use("windwp/nvim-ts-autotag")
	use("windwp/nvim-autopairs")
	use("pedro757/emmet")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("nvim-telescope/telescope.nvim") -- finder
	use("junegunn/fzf")
	use("nvim-telescope/telescope-file-browser.nvim")

	-- filer: https://github.com/lambdalisue/fern.vim
	use("lambdalisue/fern.vim")
	use("antoinemadec/FixCursorHold.nvim") -- dependence
	use("lambdalisue/nerdfont.vim")
	use("lambdalisue/glyph-palette.vim")
	use("lambdalisue/fern-renderer-nerdfont.vim")
	use("lambdalisue/fern-git-status.vim")

	-- color scheme
	use({ "Shatur/neovim-ayu" })
	use({ "CrispyBaccoon/dawn.vim" })
	use({ "bluz71/vim-moonfly-colors" })
	use({ "bluz71/vim-nightfly-guicolors" })
	use({ "ellisonleao/gruvbox.nvim" })
	use({ "rmehri01/onenord.nvim" })
	use({ "luisiacc/gruvbox-baby" })
	use({ "rockerBOO/boo-colorscheme-nvim" })
	use({ "marko-cerovac/material.nvim" })
	use({ "lmburns/kimbox" })
	use({ "cpea2506/one_monokai.nvim" })
	use({
		"olimorris/onedarkpro.nvim",
		config = function()
			require("onedarkpro").setup()
		end,
	})
	use({ "nanotech/jellybeans.vim" })
	use({ "adisen99/apprentice.nvim", requires = { "rktjmp/lush.nvim" } })
	use({ "srcery-colors/srcery-vim", as = "srcery" })
	use({ "ackyshake/Spacegray.vim" })
	use({ "pineapplegiant/spaceduck" })
	use({ "lifepillar/vim-gruvbox8" })
	use({ "danilo-augusto/vim-afterglow" })

	-- commentout
	use("terrortylor/nvim-comment")
end)

-- LSP Sever management
require("rc.mason")
require("rc.lsp-settings.diagnostic")
require("rc.cmp")
require("rc.langserver")

-- Package RCs
require("rc.autopairs")
require("rc.autotag")
require("rc.easymotion")
require("rc.emmet_ls")
require("rc.feline")
require("rc.formatter")
require("rc.fern")
require("rc.galaxyline")
require("rc.nvim-comment")
require("rc.telescope")
require("rc.treesitter")
require("rc.gitsigns")
require("rc.snippy")
