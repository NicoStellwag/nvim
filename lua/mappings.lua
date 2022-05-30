local api = vim.api

-- Alt j is escape
api.nvim_set_keymap("i", "<M-j>", "<Esc>", {})
api.nvim_set_keymap("v", "<M-j>", "<Esc>", {})
api.nvim_set_keymap("t", "<M-j>", "<Esc>", {})
api.nvim_set_keymap("s", "<M-j>", "<Esc>", {})

-- plugin calls
api.nvim_set_keymap("n", "<M-l>", "<cmd>Telescope find_files<CR>", {})
api.nvim_set_keymap("n", "<M-;>", "<cmd>Telescope live_grep<CR>", {})

-- other mappings
api.nvim_set_keymap("n", "<CR>", ":noh<CR>", { noremap = true })
