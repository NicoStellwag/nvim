local servers = { "clangd", "jsonls", "pyright", "sumneko_lua" }

for _, lsp in pairs(servers) do
	require('lspconfig')[lsp].setup {
		on_attach = require("mappings").lspconfig_onattach_mappings,
		-- capabilities = require("setup/nvim-cmp").capabilities
	}
end

vim.diagnostic.config({
	virtual_text = false
})
