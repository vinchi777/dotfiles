---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<tab>"] = "",
    ["<S-tab>"] = ""
  }
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["9i"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

local opts = { noremap = true, silent = true }
M.barbar = {
  n = {
    ["gr"] = {":BufferPrevious <CR>", opts = opts, "Previous Buffer" },
    ["gt"] = {":BufferNext <CR>", opts = opts, "Next Buffer" },
    ["1<BS>"] = {':BufferGoto 1<CR>', opts = opts },
    ["2<BS>"] = {':BufferGoto 2<CR>', opts = opts },
    ["3<BS>"] = {':BufferGoto 3<CR>', opts = opts },
    ["4<BS>"] = {':BufferGoto 4<CR>', opts = opts },
    ["5<BS>"] = {':BufferGoto 5<CR>', opts = opts },
    ["6<BS>"] = {':BufferGoto 6<CR>', opts = opts },
    ["7<BS>"] = {':BufferGoto 7<CR>', opts = opts },
    ["8<BS>"] = {':BufferGoto 8<CR>', opts = opts },
    ["9<BS>"] = {':BufferGoto 9<CR>', opts = opts },
    ["0<BS>"] = {':BufferLast<CR>', opts = opts, "Last Buffer" },
    ["qq"] = {':BufferClose <CR>', opts = opts, "Close Buffer" },
    ["<leader>b"] = {':BufferPick <CR>', opts = opts, "Pick Buffer" },
    ["<leader><"]= {':BufferMovePrevious <CR>', opts = opts, "Move Buffer Left" },
    ["<leader>>"] = {':BufferMoveNext <CR>', opts = opts, "Move Buffer Right" },
  }
}

-- M.tabufline = {
--   plugin = true,
--
--   n = {
--     -- cycle through buffers
--     ["gt"] = {
--       function()
--         require("nvchad.tabufline").tabuflineNext()
--       end,
--       "Goto next buffer",
--     },
--
--     ["gr"] = {
--       function()
--         require("nvchad.tabufline").tabuflinePrev()
--       end,
--       "Goto prev buffer",
--     },
--   },
-- }

M.copilot = {
  i = {
    ["<C-j>"] = {
      function()
        vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
      end,
      "Copilot Accept",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },

    ["<C-l>"] = {
      function()
        vim.fn.feedkeys(vim.fn["copilot#Next"](), "")
      end,
      "Copilot Accept",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
  },
}

M.lspconfig = {
   n = {
    ["<leader>fr"] = { "<cmd>Telescope lsp_references<CR>", "definitions" },
  },
}

M.telescope = {
  n = {
    ["<leader>fd"] = { "<cmd>lua require('custom/configs/telescope').live_grep_in_folder()<cr>", "Live grep in folder" },
  },
}

M.obsidian = {
  n = {
    ["<leader>os"] = { "<cmd>ObsidianSearch<CR>", "Search Obsidian" },
    ["<leader>oq"] = { "<cmd>ObsidianQuickSwitch<CR>", "Quick Switch" },
    ["<leader>on"] = { "<cmd>ObsidianNew<CR>", "New Note" },
    ["<leader>oo"] = { "<cmd>ObsidianOpen<CR>", "Open Obsidian" },
    ["<leader>or"] = { "<cmd>ObsidianRename<CR>", "Rename Obsidian" },
    -- ["<leader>ch"] = {
    --   function()
    --     return require("obsidian").util.toggle_checkbox()
    --   end,
    --   opts = { buffer = true },
    -- },
  },
}


-- more keybinds!

return M
