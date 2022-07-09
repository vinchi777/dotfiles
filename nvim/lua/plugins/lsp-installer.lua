local lsp_installer = require("nvim-lsp-installer")

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap=true, silent=true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<leader>gw', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gf', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
	--buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
	buf_set_keymap('n', '<space>f', '<cmd>Format<CR>', opts)

end

local function filter(arr, fn)
  if type(arr) ~= "table" then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function filterReactDTS(value)
  return string.match(value.uri, 'react/index.d.ts') == nil
end

local enhance_server_opts = {
	["tsserver"] = function(opts)
		--opts.on_attach = function (client, bufnr)
			---- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
			---- the resolved capabilities of the eslint server ourselves!
			--on_attach(client, bufnr)
		--end
		opts.handlers = {
			--['textDocument/publishDiagnostics'] = function(...) end,
			['textDocument/definition'] = function(err, result, method, ...)
				if vim.tbl_islist(result) and #result > 1 then
					local filtered_result = filter(result, filterReactDTS)
					return vim.lsp.handlers['textDocument/definition'](err, filtered_result, method, ...)
				end

				vim.lsp.handlers['textDocument/definition'](err, result, method, ...)
			end
		}
		opts.capabilities = capabilities
		opts.init_options = {
			maxTsServerMemory = 4096
		}
		opts.preferences = {
			importModuleSpecifierPreference = "non-relative",
		}
		opts.settings = {
			filetypes = { "typescript", "typescriptreact" },
			--flags = {
			--debounce_text_changes = 150,
			--},
			on_attach = on_atach,
			format = {
				enable = false,
			},
			preferences = {
				importModuleSpecifierPreference = "non-relative",
			},
		}
	end,
	["eslint"] = function(opts)
		opts.handlers = {
			['window/showMessageRequest'] = function(_, result, params) return result end
		}
		opts.on_attach = function (client, bufnr)
			-- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
			-- the resolved capabilities of the eslint server ourselves!
			client.resolved_capabilities.document_formatting = true
			on_attach(client, bufnr)
		end
		opts.settings = {
			format = { enable = false }, -- this will enable formatting

		}
	end
}

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
	-- Specify the default options which we'll use to setup all servers
	local opts = {}

	if enhance_server_opts[server.name] then
		-- Enhance the default opts with the server-specific ones
		enhance_server_opts[server.name](opts)
	end

	-- This setup() function will take the provided server configuration and decorate it with the necessary properties
	-- before passing it onwards to lspconfig.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
