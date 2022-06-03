if not vim.fn.has("WSL") then
	require("luasnip.loaders.from_vscode").lazy_load()
end
