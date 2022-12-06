-------------------------------------------------
-- rc/treesitter.lua
-------------------------------------------------

require("nvim-treesitter.configs").setup({
	ensure_installed = "all",

	highlight = {
		enable = true,
		disable = { "html" },
	},

	indent = {
		enable = false,
		disable = {},
	},

	autotag = {
		enable = true,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
