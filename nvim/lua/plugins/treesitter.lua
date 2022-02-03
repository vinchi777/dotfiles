require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		'typescript', 'javascript', 'python', 'ruby', 'go', 'html'
	}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	highlight = {
		enable = true,              -- false will disable the whole extension
		additional_vim_regex_highlighting = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	indent = {
		enable = true
	}
}
