require'lualine'.setup({
	options = {
		theme = 'catppuccin',
		--theme = 'tokyonight',
		-- theme = 'rose-pine',
		section_separators = {
			left = '',
			right = ''
		},
		component_separators = {
			left = '',
			right = ''
		}
	},
	sections = {
		lualine_c = {
			{
				'filename',
				path = 1,  -- 0 = just filename, 1 = relative path, 2 = absolute path
			}
		}
	},
	inactive_sections = {
		lualine_c = {
			{
				'filename',
				path = 1,  -- 0 = just filename, 1 = relative path, 2 = absolute path
			}
		},
	},
})
