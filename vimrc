""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc file
"
set autoindent
set expandtab
set gdefault
set history=50
set hlsearch
set ignorecase
set incsearch
set list
"set listchars=tab:→→,eol:¬,space:.
set listchars=tab:→→
set matchpairs+=<:>
set nocompatible
set noswapfile
set number
set pastetoggle=<F2>
set shiftround
set shiftwidth=4
set showcmd
set showmode
set smartcase
set viminfo=/15,'15,r/mnt/zip,r/mnt/floppy,f1,h,\"100
set whichwrap=h,l,~,[,]
set wildmenu
nnoremap <F6> <C-W>w
nnoremap <S-F6> <C-W>W
nnoremap Q gqap 
vnoremap Q gq 
map <C-y> :noh<CR>:setlocal number!<CR>
map <C-C> :set cursorline!<CR>:set cursorcolumn!<CR>
map <C-L> :noh<CR>:redraw!<CR>
map <f9> :w<CR>:!python3 %<CR>
map <C-n> :NERDTreeToggle<CR>
imap ;kb <kbd></kbd><left><left><left><left><left><left>
imap ;st <strong></strong><left><left><left><left><left><left><left><left><left>
imap ;so System.out.println();<left><left>
imap ;qq Keep going with the game, and let me know if you have any questions.
syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=Red ctermbg=2
filetype on
filetype indent on
filetype plugin on
autocmd FileType c,cpp,slang set cindent
autocmd FileType c set formatoptions+=ro
autocmd FileType perl set smartindent
autocmd FileType html set formatoptions+=tl
autocmd FileType html,css set noexpandtab tabstop=2
autocmd FileType make set noexpandtab shiftwidth=8
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/tmux/tmux/issues/1246 tmux color fix
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
Plug 'preservim/nerdtree'
Plug 'franbach/miramare'
Plug 'itchyny/lightline.vim'
call plug#end()
" show the status bar
set laststatus=2
set termguicolors

" the configuration options should be placed before `colorscheme miramare`
let g:miramare_enable_italic = 1
let g:miramare_disable_italic_comment = 1
colorscheme miramare
" https://github.com/franbach/miramare
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
