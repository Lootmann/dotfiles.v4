-------------------------------------------------
-- rc/lsp-settings/pylsp
-------------------------------------------------

local M = {}

M = {
	pylsp = {
		plugins = {
			configurationSources = { "mypy" },
			mypy = { enables = true },
			pylint = {
				enabled = false,
				args = {
					"-dC0114", -- missing module string
					"-dC0115", -- missing class string
					"-dC0116", -- missing method/function string
					"-dE1131", -- unsupporeted binary operation
				},
				debounce = 200,
			},

			flake8 = { enabled = false },
			pycodestyle = { enabled = false }, -- this includes flake8
			pyflakes = { enabled = false }, -- this includes also flake8

			pylsp_mypy = { enabled = true },
			pylsp_black = { enabled = true },
			pylsp_isort = { enabled = true },
		},
	},
}

return M
