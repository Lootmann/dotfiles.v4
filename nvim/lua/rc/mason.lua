-------------------------------------------------
-- rc/mason.lua
-------------------------------------------------
local function nmap(key, command, opts)
	vim.keymap.set("n", key, command, opts)
end

-- for null-ls
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
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

-- iterate all installed servers
-- https://github.com/williamboman/mason.nvim/discussions/74#discussioncomment-3151049
mason_lsp.setup_handlers({
	function(server_name)
		local lsp = server_name
		local opt = {}

		opt.on_attach = on_attach
		opt.capabilities = capabilities

		if lsp == "clangd" then
			opt = require("rc.lsp-settings.clangd")
		elseif lsp == "lua_ls" then
			opt.settings = require("rc.lsp-settings.lua_ls")
		elseif lsp == "pyright" then
			opt.settings = require("rc.lsp-settings.pyright")
		elseif lsp == "pylsp" then
			opt.settings = require("rc.lsp-settings.pylsp")
		elseif lsp == "tsserver" then
			table.insert(opt, { "single_file_support = true" })
		elseif lsp == "hls" then
			opt.settings = require("rc.lsp-settings.hls")
		end

		lspconfig[server_name].setup(opt)
	end,
})
