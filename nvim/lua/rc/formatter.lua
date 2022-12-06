-------------------------------------------------

--[[
ex)
https://github.com/npakk/dotfiles/blob/272b4a69dde43d1e4945fb1e74a5e65f19ed9ef5/config/nvim/lua/plugins/formatter.lua
https://github.com/denismaciel/dotfiles/blob/e88627da9516dd13fb011ee1aedf9b00fee58cb4/nvim/.config/nvim/lua/nvim-formatter-config.lua

official)
https://github.com/mhartington/formatter.nvim
https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes
--]]
-- local util = require('formatter.util')

require("formatter").setup({
	logging = false,

	filetype = {
		css = { require("formatter.filetypes.css").prettier },
		cpp = { require("formatter.filetypes.cpp").clangformat },
		go = {
			--require("formatter.filetypes.go").gofmt,
			--require("formatter.filetypes.go").goimports,
			require("formatter.filetypes.go").gofumpt,
		},

		html = { require("formatter.filetypes.html").prettier },
		htmldjango = { require("formatter.filetypes.html").prettier },
		javascript = {
			require("formatter.filetypes.javascript").prettier,
			--require("formatter.filetypes.javascript").prettierd,
		},

		lua = { require("formatter.filetypes.lua").stylua },
		-- this is not pretty ...
		-- markdown = { require("formatter.filetypes.markdown").prettierd },
		python = {
			require("formatter.filetypes.python").black,
			require("formatter.filetypes.python").isort,
		},

		rust = { require("formatter.filetypes.rust").rustfmt },
		toml = { require("formatter.filetypes.toml").taplo },

		typescript = { require("formatter.filetypes.typescript").prettier },
		typescriptreact = { require("formatter.filetypes.typescript").prettier },
		yaml = { require("formatter.filetypes.yaml").prettier },
		json = { require("formatter.filetypes.json").prettier },

		["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
	},
})

vim.cmd([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * silent! FormatWriteLock
augroup END
]])
