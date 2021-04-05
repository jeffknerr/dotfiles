""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc file
"
set pastetoggle=<F2>
set history=50
set viminfo=/10,'10,r/mnt/zip,r/mnt/floppy,f0,h,\"100
set showmode
set showcmd
set shiftwidth=4
set shiftround
set expandtab
set autoindent
filetype on
filetype indent on
filetype plugin on
autocmd FileType c,cpp,slang set cindent
autocmd FileType c set formatoptions+=ro
autocmd FileType perl set smartindent
autocmd FileType html set formatoptions+=tl
autocmd FileType html,css set noexpandtab tabstop=2
autocmd FileType make set noexpandtab shiftwidth=8
set ignorecase
set smartcase
set gdefault
set whichwrap=h,l,~,[,]
nnoremap <F6> <C-W>w
nnoremap <S-F6> <C-W>W
set matchpairs+=<:>
nnoremap Q gqap 
vnoremap Q gq 
" Cntl-y toggles line numbers
map <C-y> :noh<CR>:setlocal number!<CR>
map <C-L> :noh<CR>:redraw!<CR>
map <f9> :w<CR>:!python3 %<CR>
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
set noswapfile
set wildmenu
set number
set list
"set listchars=tab:→→,eol:¬,space:.
set listchars=tab:→→
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# https://github.com/tmux/tmux/issues/1246 tmux color fix
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif
call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'franbach/miramare'
Plug 'itchyny/lightline.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_fixers = {'javascript': ['prettier'],'css': ['prettier'],}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" important!!
set termguicolors

" the configuration options should be placed before `colorscheme miramare`
let g:miramare_enable_italic = 1
let g:miramare_disable_italic_comment = 1

colorscheme miramare
" https://github.com/franbach/miramare
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
