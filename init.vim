set rtp+='~/.config/nvim/'
set rtp+='~/.config/nvim/autoload'
set number
set relativenumber
set cursorline
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set mouse=
set undofile
set hidden
set clipboard+=unnamedplus
set background=dark
set completeopt-=preview
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set colorcolumn=120
syntax enable
filetype plugin indent on
let mapleader=' '
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
nnoremap <SPACE> <Nop>
nnoremap <leader>w <c-w>w
nnoremap <leader>x :bp<cr>:bd #<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>g :Ag
tnoremap <Esc> <C-\><C-n>

let g:plug_url_format = 'git@github.com:%s.git'
call plug#begin('~/.config/nvim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'github/copilot.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'akinsho/toggleterm.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'akinsho/bufferline.nvim'
Plug 'wellle/context.vim'
Plug 'ncm2/float-preview.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

set termguicolors
colorscheme dracula

nnoremap <silent><leader>] :BufferLineCycleNext<CR>
nnoremap <silent><leader>[ :BufferLineCyclePrev<CR>

nnoremap <leader>n :Neotree<CR>
autocmd StdinReadPre * let s:std_in=1

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
set updatetime=500

nnoremap <leader>s :ToggleTerm direction=float<CR>

let g:float_preview#docked = 0

autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <leader>d to show documentation in preview window
nnoremap <leader>d :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')
" clean up highlight
nnoremap <silent> <esc> :nohl<cr>


" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

lua << EOF
require("bufferline").setup{}
require("toggleterm").setup{}
require("neo-tree").setup({
  window = {
    position = "float",
  }
})
EOF
