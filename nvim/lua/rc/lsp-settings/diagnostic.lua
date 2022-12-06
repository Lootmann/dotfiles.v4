-------------------------------------------------
-- rc/lsp-settings/diagnostic.lua
-------------------------------------------------

local signs = { Error = "", Warn = "", Hint = "", Info = "" }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
	underline = true,
	virtual_text = {
		source = "always",
	},
	sings = {
		priority = 20,
	},
	float = {
		source = "always",
		border = "single",
	},
	update_in_insert = false,
	severity_sort = true,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "single",
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",
})
