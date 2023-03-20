-------------------------------------------------
-- rc/mason.lua
-------------------------------------------------
local function nmap(key, command, opts)
	vim.keymap.set("n", key, command, opts)
end

-- for null-ls
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
	local bufopts = { silent = true, buffer = bufnr }

	nmap("K", vim.lsp.buf.hover, bufopts)
	nmap("gf", vim.lsp.buf.format, bufopts)
	nmap("gr", vim.lsp.buf.references, bufopts)
	nmap("gd", vim.lsp.buf.definition, bufopts)
	nmap("gD", vim.lsp.buf.declaration, bufopts)
	nmap("gi", vim.lsp.buf.implementation, bufopts)
	nmap("gt", vim.lsp.buf.type_definition, bufopts)
	nmap("gn", vim.lsp.buf.rename, bufopts)
	nmap("ga", vim.lsp.buf.code_action, bufopts)
	nmap("ge", vim.diagnostic.open_float, bufopts)
	nmap("g]", vim.diagnostic.goto_next, bufopts)
	nmap("g[", vim.diagnostic.goto_prev, bufopts)

	client.server_capabilities.document_formatting = false

	-- null-ls
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
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
end

local status, mason = pcall(require, "mason")
if not status then
	return
end

local status2, mason_lsp = pcall(require, "mason-lspconfig")
if not status2 then
	return
end

mason.setup()
mason_lsp.setup()

-------------------------------------------------
-- language server settings
-------------------------------------------------
local status3, lspconfig = pcall(require, "lspconfig")
if not status3 then
	return
end

-- cmp is completion
local status_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp then
	return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local servers = {
	"html",
	"clangd",
	"cssls",
	"diagnosticls",
	"dockerls",
	"docker_compose_language_service",
	"gopls",
	"hls",
	"pyright",
	"pylsp",
	"rust_analyzer",
	"lua_ls",
	"tsserver",
	-- "yamlls",
	"zls",
}

for _, lsp in ipairs(servers) do
	local opt = {}

	opt.on_attach = on_attach
	opt.capabilities = capabilities

	if lsp == "clangd" then
		opt = require("rc.lsp-settings.clangd")
	elseif lsp == "lua_ls" then
		opt.settings = require("rc.lsp-settings.sumneko_lua")
	elseif lsp == "pyright" then
		opt.settings = require("rc.lsp-settings.pyright")
	elseif lsp == "pylsp" then
		opt.settings = require("rc.lsp-settings.pylsp")
	elseif lsp == "tsserver" then
		table.insert(opt, { "single_file_support = true" })
	elseif lsp == "hls" then
		opt.settings = require("rc.lsp-settings.hls")
	elseif lsp == "diagnosticls" then
		lspconfig.diagnosticls.setup({})
	end

	lspconfig[lsp].setup(opt)
end
