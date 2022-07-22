local is_windows = vim.fn.has('win32') == 1 or vim.fn.has('win32unix') == 1
if not is_windows then
	require("luasnip.loaders.from_vscode").lazy_load()
end
