--
-- https://github.com/jose-elias-alvarez/null-ls.nvim
--
local status, null_ls = pcall(require, "null-ls")

if not status then
	print("can't load null_ls")
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	-- fromatting on save
	-- Sync Formatting(most reliable way): https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function(client)
							return client.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,

	-- formatting
	sources = {
		-- cpp
		null_ls.builtins.formatting.clang_format,
		-- git
		null_ls.builtins.code_actions.gitsigns,
		-- golang
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.goimports,
		-- js, ts, html, css
		-- null_ls.builtins.diagnostics.eslint,
		-- json
		null_ls.builtins.formatting.fixjson,
		null_ls.builtins.formatting.prettier,
		-- null_ls.builtins.formatting.prettierd,
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
		-- null_ls.builtins.formatting.yamlfmt,
		-- zig
		null_ls.builtins.formatting.zigfmt,
		-- zsh
		null_ls.builtins.diagnostics.zsh,
	},
})
