"filetype off                  " required
call plug#begin('~/.vim/plugged')


" let Vundle manage Vundle, required
" Plug 'gmarik/Vundle.vim'

" Color schemes
Plug 'edkolev/tmuxline.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
"Plug 'rose-pine/neovim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

" Editor Extensions
"Plug 'SirVer/ultisnips'
Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-startify'
Plug 'nvim-lualine/lualine.nvim'

Plug 'jiangmiao/auto-pairs'
Plug 'windwp/nvim-ts-autotag'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"Plug 'honza/vim-snippets'
"Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
"Plug 'slim-template/vim-slim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-ragtag'
"Plug 'akinsho/bufferline.nvim'
Plug 'romgrk/barbar.nvim'
"Plug 'sbdchd/neoformat'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Plug 'leafgarland/typescript-vim'
"Plug 'alvan/vim-closetag'
"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'mhinz/vim-signify'
Plug 'kshenoy/vim-signature'
Plug 'kevinhwang91/nvim-bqf'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'folke/trouble.nvim'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Linter
Plug 'nvim-lua/plenary.nvim'
Plug 'mhartington/formatter.nvim'
"Plug 'jose-elias-alvarez/null-ls.nvim'
"Plug 'mfussenegger/nvim-lint'

" Languages
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } } " Run call doge#install() manually after

call plug#end()

" map escape
imap jj <esc>

" show line numbers
set number

" trailing whitespace
set listchars=tab:\ \ ,trail:~,extends:>
set list

"FUGITIVE
let g:loaded_keeppad = 20

nmap 9i :NvimTreeToggle<CR>

" no swapfile
set noswapfile

" map autocompletion
inoremap <Nul> <C-n>

"auto copy to clipboard
"set clipboard=unnamedplus

"remove trailing whitespace
nnoremap <silent> dt :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <CR> :noh<CR><CR>

" INDENTING
autocmd BufNewFile,BufReadPost *.html.erb,*.html setl shiftwidth=2 expandtab
autocmd BufNewFile,BufReadPost *.vue,*.php setl shiftwidth=4 expandtab
autocmd BufNewFile,BufReadPost *.go setl shiftwidth=4 tabstop=4 noexpandtab
autocmd BufNewFile,BufReadPost *.js,*.ts,*.tsx setl shiftwidth=2 tabstop=2 expandtab
autocmd BufNewFile,BufReadPost *.css,*.scss setl shiftwidth=2
autocmd FileType yaml setl shiftwidth=2 expandtab


" TELESCOPE
nnoremap <silent><C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <silent><C-l> <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').search_history()<cr>

" set filetypes as typescript.tsx
"autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" vim-closetag
let g:closetag_filenames = '*.html,*.js,*.vue,*.html.erb,*.tsx'

" Golang
let g:go_info_mode='gopls'
let g:go_doc_keywordprg_enabled = 0

"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
set signcolumn=yes

command! BufOnly silent! execute "%bd|e#|bd#"

"set shortmess+=c
"set cmdheight=2

" tmuxline curved corners
" needs edkolev/tmuxline.vim installed
let g:tmuxline_separators = {
    \ 'left' : '???',
    \ 'left_alt': '>',
    \ 'right' : '???',
    \ 'right_alt' : '<',
    \ 'space' : ' '}

set colorcolumn=80

"Ack
nmap <D-S-F> :Ack<space>
" use the silver searcher in Ack
let g:ackprg = 'ag --nogroup --nocolor --column'


" Startify
let g:startify_files_number           = 4
let g:startify_padding_left           = (&columns - (&columns/2)) - 30
let g:startify_enable_special = 1
let g:startify_change_to_dir = 0
autocmd User Startified setlocal buflisted

" Simplify the startify list to just recent files and sessions
let g:startify_lists = [
  \ { 'type': 'dir',       'header': startify#pad(['Recent files']) },
  \ { 'type': 'sessions',  'header': startify#pad(['Saved sessions']) },
  \ ]

" Fancy custom header
let g:startify_custom_header = startify#center([
  \ "  ",
  \ "  ",
  \ "  ",
  \ "  ",
  \ "  ",
  \ '   ??? ???   ???   ?????????',
  \ '   ?????????   ???   ?????????',
  \ '   ??????    ???   ??? ???',
  \ '   ',
  \ '   ',
  \ '   ',
  \ ])

set hidden

"BUFFERS
nnoremap qq :w\|bd<cr>
autocmd BufEnter *.png,*.jpg,*gif exec "! open ".expand("%") | :bw


"NVIM TREE
let g:nvim_tree_gitignore = 1 "0 by default
highlight LuaTreeFolderIcon guibg=blue

" Disable default mappings by plugin
" Bindings are enable by default, disabled on any non-zero value
let lua_tree_disable_keybindings=0

" COLOR THEMES
"
set t_Co=256
set background=light
"set background=dark

"if (has("termguicolors"))
"set termguicolors
"endif
set termguicolors

syntax on "load polyglot language packs
syntax enable

" NVM CMP (AUTOCOMPLETIONS)
set completeopt=menu,menuone,noselect

" QUICKFIX LIST
" Ecs to close quickfix window
"nnoremap <silent> <ESC> :ccl<CR>

inoremap <c-n> <c-x><c-o>

lua << EOF
require('plugins/catpuccin')
require('plugins/theme')
require('plugins/barbar')
require('plugins/lualine')
--require('plugins/lspconfig')
require('plugins/lsp-installer')
require('plugins/cmp')
require('plugins/nvim-tree')
require('plugins/treesitter')
require('plugins/trouble')
-- require('plugins/null-ls')
require('plugins/ts-autotag')
require('plugins/nvim-bqf')
require('plugins/telescope')
require('plugins/formatter')
EOF
