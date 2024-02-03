local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = overrides.gitsigns,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },

  {
    "github/copilot.vim",
    lazy = false,
    config = function() -- Mapping tab is already used by NvChad
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      --- vim.g.copilot_tab_fallback = "";
      -- The mapping is set to other key, see custom/lua/mappings
      -- or run <leader>ch to see copilot mapping section
    end,
  },

  {
    "tpope/vim-fugitive",
    lazy = false,
    opts = overrides.fugitive,
  },

  {
    "tpope/vim-rhubarb",
    lazy = false,
    opts = overrides.rhubarb,
  },

  -- In order to modify the `lspconfig` configuration:
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "romgrk/barbar.nvim",
    lazy = false,
    config = function()
      vim.api.nvim_set_hl(0, "BufferCurrent", { ctermbg=0, bg='white' })
      vim.api.nvim_set_hl(0, "BufferInactive", { ctermbg=0, bg='lightgrey', fg='white' })
      require('barbar').setup(overrides.barbar)
    end,
  },

  {
    "nvimdev/dashboard-nvim",
    event = 'VimEnter',
    lazy = false,
    opts = overrides.dashboard,
    config = function()
      vim.api.nvim_set_hl(0, "DashboardHeader", { ctermbg=0, fg='#0083be' })
      require('dashboard').setup(overrides.dashboard)
    end,
  },

  {
    "mg979/vim-visual-multi",
    lazy = false,
    opts = overrides.visual_multi,
    config = function()
      vim.cmd([[
        let g:VM_maps["Remove Region"]               = '<C-p>'
      ]])
    end
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
