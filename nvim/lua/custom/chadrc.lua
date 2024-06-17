---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
  pattern = "*.js,*.ts,*.tsx",
  command = "setlocal shiftwidth=4 tabstop=4 expandtab",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "html",
  command = "setlocal shiftwidth=2 tabstop=2",
})

vim.api.nvim_create_user_command(
  'Browse',
  function (opts)
    vim.fn.system { 'open', opts.fargs[1] }
  end,
  { nargs = 1 }
)

-- Auto read file when changed outside of vim
vim.opt.autoread = true

local function stbufnr()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid)
end

M.ui = {
  theme = "one_light",
  theme_toggle = { "onedark", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  -- nvdash (dashboard)
  nvdash = {
    enabled = false,
    load_on_startup = false,
  },

  tabufline = {
    enabled = false,
  },

  statusline = {
    theme = "vscode_colored",
    -- overriden_modules = function(modules)
    --   modules[2] = (function()
    --     local icon = "󰈚 "
    --     local path = vim.api.nvim_buf_get_name(stbufnr())
    --     local name = (path == "" and "Empty ") or path:match "([^/\\]+)[/\\]*$"
    --     local relative_path = vim.fn.fnamemodify(path, ":~:.:h")
    --
    --     if name ~= "Empty " then
    --       local devicons_present, devicons = pcall(require, "nvim-web-devicons")
    --
    --       if devicons_present then
    --         local ft_icon = devicons.get_icon(name)
    --         icon = (ft_icon ~= nil and ft_icon) or icon
    --       end
    --
    --       name = "/" .. name .. " "
    --     end
    --
    --     return "%#StText# " .. icon .. " " .. relative_path .. name
    --   end)()
    --
    --   -- define the somefunction anywhwere in your custom dir, just call it well!
    --   -- modules[2] = somefunction()
    --
    --   -- adding a module between 2 modules
    --   -- Use the table.insert functin to insert at specific index
    --   -- This will insert a new module at index 2 and previous index 2 will become 3 now
    -- end,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
