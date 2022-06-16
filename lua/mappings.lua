local M = {}

-- Alt j is escape
vim.api.nvim_set_keymap("i", "<M-j>", "<Esc>", {})
vim.api.nvim_set_keymap("v", "<M-j>", "<Esc>", {})
vim.api.nvim_set_keymap("t", "<M-j>", "<Esc>", {})
vim.api.nvim_set_keymap("s", "<M-j>", "<Esc>", {})

-- other mappings
vim.api.nvim_set_keymap("n", "<CR>", ":noh<CR>", { noremap = true })

-- telescope
vim.api.nvim_set_keymap("n", "<M-l>", "<cmd>Telescope find_files<CR>", {})
vim.api.nvim_set_keymap("n", "<M-;>", "<cmd>Telescope live_grep<CR>", {})

-- treesitter units
vim.api.nvim_set_keymap('x', 'iu', ':lua require"treesitter-unit".select()<CR>', {noremap=true})
vim.api.nvim_set_keymap('x', 'au', ':lua require"treesitter-unit".select(true)<CR>', {noremap=true})
vim.api.nvim_set_keymap('o', 'iu', ':<c-u>lua require"treesitter-unit".select()<CR>', {noremap=true})
vim.api.nvim_set_keymap('o', 'au', ':<c-u>lua require"treesitter-unit".select(true)<CR>', {noremap=true})

-- lspconfig
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- lspconfig (only on server attach)
local lspconfig_onattach_mappings = function(client, bufnr)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- lspsaga
vim.api.nvim_set_keymap('n', 'gf', '<cmd>lua require"lspsaga.provider".lsp_finder()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gx', '<cmd>lua require"lspsaga.codeaction".code_action()<CR>', opts)
vim.api.nvim_set_keymap('v', 'gx', '<cmd>lua require"lspsaga.codeaction".range_code_action()<CR>', opts)
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua require"lspsaga.hover".render_hover_doc()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-j>', '<cmd>lua require"lspsaga.action".smart_scroll_with_saga(1)<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua require"lspsaga.action".smart_scroll_with_saga(-1)<CR>', opts)
vim.api.nvim_set_keymap('n', 'gs', '<cmd>lua require"lspsaga.signaturehelp".signature_help()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua require"lspsaga.rename".rename()<CR>', opts)
-- vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua require"lspsaga.provider".preview_definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'go', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
vim.api.nvim_set_keymap('n', 'gh', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.api.nvim_set_keymap('n', 'gl', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.api.nvim_set_keymap('n', '<M-k>', '<cmd>lua require"lspsaga.floaterm".open_float_terminal()<CR>', opts)
vim.api.nvim_set_keymap('t', '<M-j>', '<cmd>lua require"lspsaga.floaterm".close_float_terminal()<CR>', opts)


M.lspconfig_onattach_mappings = lspconfig_onattach_mappings
return M
