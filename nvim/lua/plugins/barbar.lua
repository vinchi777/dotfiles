local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', 'gr', ':BufferPrevious<CR>', opts)
map('n', 'gt', ':BufferNext<CR>', opts)

-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
map('n', '<A->>', ' :BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '1<BS>', ':BufferGoto 1<CR>', opts)
map('n', '2<BS>', ':BufferGoto 2<CR>', opts)
map('n', '3<BS>', ':BufferGoto 3<CR>', opts)
map('n', '4<BS>', ':BufferGoto 4<CR>', opts)
map('n', '5<BS>', ':BufferGoto 5<CR>', opts)
map('n', '6<BS>', ':BufferGoto 6<CR>', opts)
map('n', '7<BS>', ':BufferGoto 7<CR>', opts)
map('n', '8<BS>', ':BufferGoto 8<CR>', opts)
map('n', '9<BS>', ':BufferGoto 9<CR>', opts)
map('n', '0<BS>', ':BufferLast<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
-- Sort automatically by...
--map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', opts)
--map('n', '<Space>bd', ':BufferOrderByDirectory<CR>', opts)
--map('n', '<Space>bl', ':BufferOrderByLanguage<CR>', opts)
map('n', '<Space>b', ':BufferPick<CR>', opts)
