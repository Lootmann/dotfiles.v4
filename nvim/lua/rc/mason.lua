-------------------------------------------------
-- rc/mason.lua
-------------------------------------------------

local function nmap(key, command, opts)
	vim.keymap.set("n", key, command, opts)
end

-- dont use function(client,)
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

mason_lsp.setup({
	ensure_installed = { "sumneko_lua", "tailwindcss" },
})

mason_lsp.setup_handlers({
	function(server)
		local opt = {}

		opt.on_attach = on_attach

		if server == "sumneko_lua" then
			opt.settings = require("rc.lsp-settings.sumneko_lua")
		elseif server == "pyright" then
			opt.settings = require("rc.lsp-settings.pyright")
		elseif server == "pylsp" then
			opt.settings = require("rc.lsp-settings.pylsp")
		end

		require("lspconfig")[server].setup(opt)
	end,
})
