--
-- https://github.com/jose-elias-alvarez/null-ls.nvim
--
local status, null_ls = pcall(require, "null-ls")

if not status then
	print("can't load null_ls")
	return
end

null_ls.setup({
	sources = {
		-- cpp
		null_ls.builtins.formatting.clang_format,
		-- git
		null_ls.builtins.code_actions.gitsigns,
		-- golang
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.goimports,
		-- js, ts
		-- null_ls.builtins.diagnostics.eslint,
		-- null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.prettierd,
		-- lua
		null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.formatting.lua_format,
		-- python
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
		-- rust
		null_ls.builtins.formatting.rustfmt,
		-- shell
		null_ls.builtins.code_actions.shellcheck,
		-- util
		null_ls.builtins.completion.spell,
		-- yaml
		null_ls.builtins.formatting.yamlfmt,
		-- zig
		null_ls.builtins.formatting.zigfmt,
	},
})
