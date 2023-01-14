-------------------------------------------------
-- rc/lsp-settings/sumneko_lua.lua
-------------------------------------------------

local M = {}

-- supress `vim` global warning
M = {
	Lua = {
		diagnostics = {
			globals = { "vim" },
		},
		workspace = {
			library = vim.api.nvim_get_runtime_file("", true),
			checkThirdParty = false,
		},
	},
}

return M
