-------------------------------------------------
-- rc/langserver.lua
-------------------------------------------------
local status, lspconfig = pcall(require, "lspconfig")
if not status then
	return
end

-- cmp is completion
local status_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp then
	return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
capabilities.offsetEncoding = "utf-8" -- fix clangd: found multiple encoding

local servers = {
	"html",
	"cssls",
	"tsserver",
	"clangd",
}

for _, lsp in ipairs(servers) do
	if lsp == "clangd" then
		lspconfig[lsp].setup({
			capabilities = capabilities,
			cmd = {
				"clangd",
				"--background-index",
				"--pch-storage=memory",
				"--clang-tidy",
				"--suggest-missing-includes",
				"--completion-style=detailed",
			},
			init_options = {
				clangdFileStatu = true,
				usePlacehodlers = true,
				completeUnimported = true,
				semanticHighlighting = true,
			},
		})
	else
		lspconfig[lsp].setup({
			capabilities = capabilities,
		})
	end
end
