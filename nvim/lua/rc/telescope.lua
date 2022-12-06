-------------------------------------------------
-- rc/telescope.lua
-------------------------------------------------

-- Nmap("<leader>f", '<cmd>lua require("telescope.builtin").find_files()<CR>')
Nmap("<leader>f", ":Telescope file_browser<CR>")
Nmap("<leader>b", '<cmd>lua require("telescope.builtin").buffers()<CR>')
Nmap("<leader>g", "<cmd>Telescope live_grep find_command=rg<CR>")
Nmap("<leader>h", '<cmd>lua require("telescope.builtin").help_tags()<CR>')

local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		mapping = {
			n = {
				["q"] = actions.close,
			},
		},
		winblend = 35,
	},
	extensions = {
		file_browser = {
			theme = "ivy",
			hijack_netrw = true,
			mappings = {},
		},
	},
})

require("telescope").load_extension("file_browser")
