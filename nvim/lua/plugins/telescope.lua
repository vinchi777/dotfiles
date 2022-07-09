local actions = require("telescope.actions")
require("telescope").setup{
	defaults = {
		mappings = {
			i = {
				["<C-h>"] = "which_key",
				["<C-u>"] = false,
				["<esc>"] = actions.close,
			},
		},
		file_ignore_patterns = {"public"},
	}
}
