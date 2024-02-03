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
    project = { enable = false }
  },
}

M.gitsigns = {
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
  }
}

return M
