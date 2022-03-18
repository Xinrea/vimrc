set rtp+='~/.config/nvim/autoload'
set number
set relativenumber
set cursorline
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set undofile
set hidden
let mapleader=' '
nnoremap <SPACE> <Nop>
nnoremap <leader> <c-w>w
tnoremap <Esc> <C-\><C-n>

call plug#begin('~/.config/nvim/plugged')
Plug 'github/copilot.vim'
Plug 'rafamadriz/neon'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'akinsho/toggleterm.nvim'
call plug#end()

colorscheme neon

let g:deoplete#enable_at_startup = 1

" NerdTree settings
nnoremap <leader>n :NERDTreeFocus<CR>
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Go settings
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
let g:go_fmt_command = "gofmt"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_metalinter_command='golangci-lint'
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "3s"
let g:go_list_type = "quickfix"
autocmd FileType go nmap <leader>i <Plug>(go-doc)
let g:go_auto_type_info = 1
set updatetime=50

nnoremap <leader>s :ToggleTerm direction=float<CR>
