local telescope = require("telescope")
local actions = require("telescope.actions")
local previewers = require("telescope.previewers")
telescope.setup {
	defaults = {
		previewer = true,
		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous
			},
			n = {
				["<M-j>"] = actions.close
			}
		},
		layout_strategy = 'flex'
	}
}
telescope.load_extension('fzf')
