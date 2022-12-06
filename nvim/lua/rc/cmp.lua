-------------------------------------------------
-- rc/cmp.lua
-------------------------------------------------
local s1, cmp = pcall(require, "cmp")
if not s1 then
	return
end

cmp.setup({
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "snippy" },
	}),

	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-l>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),

	snippet = {
		expand = function(args)
			require("snippy").expand_snippet(args.body)
		end,
	},

	experimental = {
		ghost_text = true,
	},
})
