-------------------------------------------------
-- rc/lsp-settings/sumneko_lua.lua
-------------------------------------------------

local M = {}

-- supress `vim` global warning
M = {
	Lua = {
		diagnostics = {
			globals = {
				"vim",
			},
		},
	},
}

return M
