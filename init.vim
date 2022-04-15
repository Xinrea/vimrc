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
set completeopt-=preview
let mapleader=' '
nnoremap <SPACE> <Nop>
nnoremap <leader>w <c-w>w
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yaegassy/coc-volar', {'do': 'yarn install --frozen-lockfile'}
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' Icons without colours
Plug 'akinsho/bufferline.nvim'
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()

set termguicolors
lua << EOF
require("bufferline").setup{}
EOF

" Bufferline settings
nnoremap <silent><leader>] :BufferLineCycleNext<CR>
nnoremap <silent><leader>[ :BufferLineCyclePrev<CR>

colorscheme neon

let g:deoplete#enable_at_startup = 1

" NerdTree settings
" NerdTree settings
nnoremap <leader>n :NERDTreeFocus<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Close the tab if NERDTree is the only window remaining in it.
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


highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

let NERDTreeShowHidden=1

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

