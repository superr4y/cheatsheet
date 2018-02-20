let mapleader = " " " space is <Leader>-Key

"let g:python_host_prog='/usr/bin/python'
"let g:python3_host_prog='/usr/bin/python3'

call plug#begin('~/.local/share/nvim/plugged')
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'

" required: pip[3]* install neovim, CheckHelth for more infos
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'bling/vim-airline'
Plug 'zchee/deoplete-jedi'

"Plug 'sebastianmarkow/deoplete-rust'
Plug 'flazz/vim-colorschemes'

"Plug 'rust-lang/rust.vim'
Plug 'souffle-lang/souffle.vim'

" required: clang, pip install clang?
Plug 'zchee/deoplete-clang'

" required: clang-format
Plug 'rhysd/vim-clang-format'
call plug#end()


" Use deoplete.
let g:deoplete#enable_at_startup = 1

"let g:deoplete#sources#rust#racer_binary='/home/user/.cargo/bin/racer'
"let g:deoplete#sources#rust#rust_source_path='/home/user/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
let g:deoplete#sources#clang#libclang_path='/usr/lib/llvm-3.8/lib/libclang.so.1'
let g:deoplete#sources#clang#clang_header='/usr/lib/clang'


" color
" set background=dark
" colo gruvbox
set t_Co=256
colorscheme jellybeans

"set g:airline_theme='gruvbox'
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set number
syntax on
"set relativenumber number
set undofile
set undodir="~/.vim_undo_files"
set noswapfile
set hlsearch
set incsearch
set shiftwidth=4
set tabstop=4
set smarttab
set nosmartindent
set foldmethod=marker
set guicursor=

"augroup AutoSaveFolds
"  autocmd!
"  autocmd BufWinLeave * mkview
"  autocmd BufWinEnter * silent loadview
"augroup END

"autocmd FileType c,cpp,h,hpp,cc setlocal foldmethod=syntax
autocmd FileType dot map <F5> :w<CR>:!xdot "%"<CR>
autocmd FileType python map <F5> :w<CR>:!python2 "%"<CR>

map <Leader>c "+y
map <Leader>v <Esc>:set paste<CR>"+p<Esc>:set nopaste<CR>
map <Leader>s :so ~/.nvimrc<Cr>
map <Leader>w <Esc>:w<CR>

imap jk <esc>
nnoremap Q <nop>
nnoremap ; :
vmap < <gv
vmap > >gv
map <esc> :noh<cr>

" Plugin Mappings
map <Leader>f <Esc>:ClangFormat<CR>
map <Leader>b <Esc>:CtrlPBuffer<CR>
map <Leader>p <Esc>:CtrlP<CR>
