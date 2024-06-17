local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "tailwindcss",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.barbar = {
  icons = {
    separator_at_end = false,
  },
}

M.nvterm = {
  terminals = {
    type_opts = {
      float = {
        relative = "editor",
        row = 0.2,
        col = 0.20,
        width = 0.6,
        height = 0.6,
        border = "single",
      },
    },
  },
}

M.dashboard = {
  theme = "hyper", --  theme is doom and hyper default is hyper
  config = {
    header = {
      [[                                                    ]],
      [[ ███╗   ██╗██╗   ██╗██╗███╗   ███╗ ]],
      [[ ████╗  ██║██║   ██║██║████╗ ████║ ]],
      [[ ██╔██╗ ██║██║   ██║██║██╔████╔██║ ]],
      [[ ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
      [[ ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
      [[ ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
      [[                                                    ]],
    },
    shortcut = {
      {
        icon = " ",
        icon_hl = "@variable",
        desc = "Files",
        group = "Label",
        action = "Telescope find_files",
        key = "<leader>ff",
      },
    },
    packages = { enable = true },
    project = { enable = false },
  },
}

M.gitsigns = {
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
  },
}

M.obsidian = {
  -- workspaces = {
  --   {
  --     name = "personal",
  --     path = "~/Documents/Obsidian Vault/personal",
  --   },
  --   {
  --     name = "work",
  --     path = "~/Documents/Obsidian Vault/work",
  --   },
  -- },
  dir = "~/Documents/Obsidian Vault",
  picker = {
    -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
    name = "telescope.nvim",
    -- Optional, configure key mappings for the picker. These are the defaults.
    -- Not all pickers support all mappings.
    mappings = {
      -- Create a new note from your query.
      new = "<C-x>",
      -- Insert a link to the selected note.
      insert_link = "<C-l>",
    },
  },
  -- Optional, customize how names/IDs for new notes are created.
  note_id_func = function(title)
    return title
  end,
}

M.barbecue = {
  theme = {
    -- this highlight is used to override other highlights
    -- you can take advantage of its `bg` and set a background throughout your winbar
    -- (e.g. basename will look like this: { fg = "#c0caf5", bold = true })
    normal = { fg = "#a7a6a7" },
    -- normal = { fg = "#c0caf5" },

    -- these highlights correspond to symbols table from config
    ellipsis = { fg = "#737aa2" },
    separator = { fg = "#737aa2" },
    modified = { fg = "#737aa2" },

    -- these highlights represent the _text_ of three main parts of barbecue
    dirname = { fg = "#737aa2" },
    basename = { },
    context = {},

    -- these highlights are used for context/navic icons
    context_file = { fg = "#a7a6a7" },
    context_module = { fg = "#a7a6a7" },
    context_namespace = { fg = "#a7a6a7" },
    context_package = { fg = "#a7a6a7" },
    context_class = { fg = "#a7a6a7" },
    context_method = { fg = "#a7a6a7" },
    context_property = { fg = "#a7a6a7" },
    context_field = { fg = "#a7a6a7" },
    context_constructor = { fg = "#a7a6a7" },
    context_enum = { fg = "#a7a6a7" },
    context_interface = { fg = "#a7a6a7" },
    context_function = { fg = "#a7a6a7" },
    context_variable = { fg = "#a7a6a7" },
    context_constant = { fg = "#a7a6a7" },
    context_string = { fg = "#a7a6a7" },
    context_number = { fg = "#a7a6a7" },
    context_boolean = { fg = "#a7a6a7" },
    context_array = { fg = "#a7a6a7" },
    context_object = { fg = "#a7a6a7" },
    context_key = { fg = "#a7a6a7" },
    context_null = { fg = "#a7a6a7" },
    context_enum_member = { fg = "#a7a6a7" },
    context_struct = { fg = "#a7a6a7" },
    context_event = { fg = "#a7a6a7" },
    context_operator = { fg = "#a7a6a7" },
    context_type_parameter = { fg = "#a7a6a7" },
  },
  lead_custom_section = function()
    return "     "
  end,
  custom_section = function()
    return ""
  end,
  separator = "",
}

return M
