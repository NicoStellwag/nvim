local servers = require('setup/lsp-installer').get_servers()

for _, lsp in pairs(servers) do
	local config = {
		on_attach = require("mappings").lspconfig_onattach_mappings,
		capabilities = require("setup/nvim-cmp").capabilities
	}

	-- server specific config
	if (lsp == 'arduino_language_server') then
		config.cmd = {
			"arduino-language-server",
			"-fqbn",
			"arduino:mbed_nano:nano33ble",
			"-cli-daemon-addr",
			"localhost:50051",
			"-cli-daemon-instance",
			"1",
			"-clangd",
			"clangd"
		}
	end

	require('lspconfig')[lsp].setup(config)
end

vim.diagnostic.config({
	virtual_text = false
})
