set noswapfile
set hlsearch
set showmatch
set number

set autoindent     " Auto Indent
set smartindent    " Smart Indent
set cindent        " C-style Indent

set smarttab       " Smart handling of the tab key
set shiftround     " Round indent to multiple of shiftwidth
set shiftwidth=4   " Number of spaces for each indent
set tabstop=4      " Number of spaces for tab key
set softtabstop=4  " Number of spaces for tab key while performing editing operations

set backspace=2
filetype off
set t_Co=256
set bg=dark

set laststatus=2
set statusline=File:\ %t\%r%h%w\ [%{&ff},%{&fileencoding},%Y]\ %m%=\ [AscII=\%03.3b]\ [Hex=\%02.2B]\ [Pos=%l,%v,%p%%]\ [LINE=%L]

set history=1000   " keep 1000 lines of command line history
set ruler          " show the cursor position all the time
set showcmd        " display incomplete commands
set incsearch      " do incremental searching

set lazyredraw     " Do not redraw while running macros (much faster) (LazyRedraw)

set foldmethod=indent
set foldlevel=1000
set foldnestmax=5

syntax on
" colorscheme peaksea_new
" colorscheme monokai_pro

" Favorite file types
set ffs=unix,dos,mac

"tab function hotkey
nmap tl :tabnext<CR>
nmap th :tabprev<CR>
nmap tn :tabnew<CR>
nmap tc :tabclose<CR>

nmap <SPACE> :noh<CR>

map > <C-w>><C-w>
map < <C-w><<C-w>

" <F12> for TagbarToggle
" nmap <ESC>O[ :TagbarToggle<CR>
nmap <ESC>O[ :Vista!!<CR>


call plug#begin('~/.local/share/nvim/site/plugged')

" Plug 'vijaymarupudi/nvim-fzf'
" Plug 'tanvirtin/monokai.nvim'

" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
" Plug 'hrsh7th/nvim-cmp'

" For ultisnips users.
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'

call plug#end()
