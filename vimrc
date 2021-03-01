""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc file
"
colorscheme **tango2**
set number
"
" Vundle stuff ---------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
"Plugin 'valloric/youcompleteme'
Plugin 'Markdown-syntax'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'hdima/python-syntax'
Plugin 'sheerun/vim-polyglot'
"Plugin 'nathanaelkane/vim-indent-guides'
"
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ----------------------------------------------
"
"
set laststatus=2
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%#LineNr#
set statusline+=\ %F
set statusline+=%m\ 
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 
"
set textwidth=72
" so I can paste with the mouse
"set paste
" this gets in the way of cindent, so let's just make it easy to toggle...
set pastetoggle=<F2>
"
" auto backups
"set backup
" backup file name extension
"set backupext=.foo
"
" format a paragraph with v key
"map v !}fmt
"
" no autowrap of lines
set wrapmargin=2
autocmd FileType mail,human,c,html,py,tex set wrapmargin=0
autocmd FileType c,html,py,tex,md set textwidth=0
"
"
" stuff from Smylers's .vimrc
" http://www.stripey.com/vim/
"
" have syntax highlighting in terminals which can display colours:
if has('syntax') && (&t_Co > 2)
   syntax on
   "colorscheme jk_one
   hi MatchParen             guifg=#38ff56 guibg=#0000ff gui=bold ctermbg=4 
endif
" highlight PreProc   term=bold cterm=bold ctermfg=2 guifg=Cyan
"
" have fifty lines of command-line (etc) history:
set history=50
" remember all of these between sessions, but only 10 search terms; also
" remember info for 10 files, but never any on removable disks, don't remember
" marks in files, don't rehighlight old search patterns, and only save up to
" 100 lines of registers; including @10 in there should restrict input buffer
" but it causes an error for me:
set viminfo=/10,'10,r/mnt/zip,r/mnt/floppy,f0,h,\"100
"
" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full
"
" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd
"
" use indents of 2 spaces, and have them copied down lines:
set shiftwidth=2
set shiftround
set expandtab
set autoindent
"
" get rid of the default style of C comments, and define a style with two stars
" at the start of `middle' rows which (looks nicer and) avoids asterisks used
" for bullet lists being treated like C comments; then define a bullet list
" style for single stars (like already is for hyphens):
set comments-=s1:/*,mb:*,ex:*/
set comments+=s:/*,mb:**,ex:*/
set comments+=fb:*

" treat lines starting with a quote mark as comments (for `Vim' files, such as
" this very one!), and colons as well so that reformatting usenet messages from
" `Tin' users works OK:
set comments+=b:\"
set comments+=n::
"
" enable filetype detection:
filetype on
filetype indent on
filetype plugin on
"
" in human-language files, automatically format everything at 72 chars:
autocmd FileType mail,human set formatoptions+=t textwidth=72

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent

" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro
"
" for Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent
autocmd FileType python setlocal expandtab shiftwidth=2 softtabstop=2

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" for both CSS and HTML, use genuine tab characters for indentation, to make
" files a few bytes smaller:
autocmd FileType html,css set noexpandtab tabstop=2

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8

" special autocmd...run a python prog when specific file is written
" autocmd FileWritePost /var/www/cs/inc/STYLE_editme.css !/var/www/cs/inc/run_style.py
autocmd BufWritePost /var/www/cs/inc/STYLE_editme.css !/var/www/cs/inc/run_style.py

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" show the `best match so far' as search strings are typed:
"set incsearch

" assume the /g flag on :s substitutions to replace all matches in a line:
set gdefault

" have the h and l cursor keys wrap between lines (like <Space> and <BkSpc> do
" by default), and ~ covert case over line breaks; also have the cursor keys
" wrap in insert mode:
set whichwrap=h,l,~,[,]

" page down with <Space> (like in `Lynx', `Mutt', `Pine', `Netscape Navigator',
" `SLRN', `Less', and `More'); page up with - (like in `Lynx', `Mutt', `Pine'),
" or <BkSpc> (like in `Netscape Navigator'):
"noremap <Space> <PageDown>
"noremap <BkSpc> <PageUp>
noremap - <PageUp>
" [<Space> by default is like l, <BkSpc> like h, and - like k.]

" use <F6> to cycle through split windows (and <Shift>+<F6> to cycle backwards,
" where possible):
nnoremap <F6> <C-W>w
nnoremap <S-F6> <C-W>W

" use <Ctrl>+N/<Ctrl>+P to cycle through files:
nnoremap <C-N> :next<CR>
nnoremap <C-P> :prev<CR>
" [<Ctrl>+N by default is like j, and <Ctrl>+P like k.]

" have % bounce between angled brackets, as well as t'other kinds:
set matchpairs+=<:>

" have Q reformat the current paragraph (or selected text if there is any):
nnoremap Q gqap 
vnoremap Q gq 

" branen's refresh to get rid of the search highlights
map <C-L> :noh<CR>:redraw!<CR>

"
" html mapping
imap ;kb <kbd></kbd><left><left><left><left><left><left>
imap ;st <strong></strong><left><left><left><left><left><left><left><left><left>
" 
" more fun from Ben Kuperman
imap ;so System.out.println();<left><left>
imap ;ne <esc>/;<cr>a
vmap <buffer> ;bo "zdi<B><c-r>z</B><esc>
map ;b i**<esc>A**<esc>
"
" timestamp fun
"let b:timestamp_rep = '%d/%m/%Y %R #f'
"
" indent guides
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  ctermbg=darkgrey
hi IndentGuidesEven ctermbg=black
"
" spell stuff
if has("spell")
    set nospell
    highlight PmenuSel ctermfg=black ctermbg=lightgray 
    map <F5> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>
    set sps=best,10
endif
"
" 
" more from ben...
let spell_language_list = "american"

" ycm
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" cursor location toggle
map <C-C> :set cursorline!<CR>:set cursorcolumn!<CR>
"
" python run with F9
map <f9> :w<CR>:!python3 %<CR>
"
" same for g++??
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  exec "!gcc % -o %<"
  exec "! ./%<"
endfunc
"
" and java
" F7/F8 compile/run default file.
"map <F7> :set makeprg=javac %<CR>:make<CR>
"map <F8> :!echo %\\|awk -F. '{print $1}'\\|xargs java<CR>
" With these you can cl/cn/cp (quickfix commands) to browse the errors
" after you compile it with :make
"set makeprg=javac\\ %
"set errorformat=%A:%f:%l:\\ %m,%-Z%p^,%-C%.%#
"setlocal makeprg=javac\ #<.java
"setlocal errorformat=%f:%l:%m
"
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
"map <F5> :make<Return>:copen<Return>
"map <F6> :cprevious<Return>
"map <F7> :cnext<Return>
map <F7> :w<CR>:make<Return>
map <F8> :!echo %\|awk -F. '{print $1}'\|xargs java<CR>
let java_highlight_functions=1
"
" from Hacking VIM book:
" highlight stuff past 72nd column
"match ErrorMsg /\%>73v.\+/
" 2match ErrorMsg /[\t]/
" set number
" set spell
" set spelllang=en_us
"
" pathogen
"execute pathogen#infect()
" pydiction
"let g:pydiction_location = '.vim/bundle/pydiction/complete-dict'
"let g:pydiction_menu_height = 20
"
" UltiSnips...
" declare global configuration dictionary so that config options can be added:
"let g:UltiSnips = {}

" customize mappings, eg use snipmate like behaviour
"let g:UltiSnips.ExpandTrigger = "<tab>"
" " It does make sense to not use <tab> here, use UltiSnips default <c-j>
" " let g:UltiSnips.JumpForwardTrigger = "<tab>"
" let g:UltiSnips.JumpBackwardTrigger = "<c-k>"

" Now its time to tell UltiSnips about which snippets to load.
" You do so for snipmate snippets and UltiSnips snippets individually.
" This example illustrates a setup loading snipmate snippets.

" See plugin/UltiSnips.vim, it has much additional documentation.
" Assuming you're not overrding the default implemenation in the
" VimL function SnippetFilesForCurrentExpansionDefaultImplementation.

" == UltiSnips snippets ==
" Because I want to use the snipmate snippets 'default' does not load
" filetype.snippets snippet files.
" SirVer called the snippets to be present for all filetypes "all".
" So this fork follows his convention. Compare with _ which is used by
" snipmate but means the same.
"
" Now the default implementation reads &filetype, looks up the key in the
" dictionary and falls back to the default entry if there is no filetype
" specific entry.
"
" Thus if you're editing a cpp file ['cpp'] means that
" &rtp/UltiSnips/cpp.snippets and ..../all.snippets will be loaded if
" UltiSnips directory happens to be in your [._].vim directory only.
"
" For all other filetypes 'default' applies, which loads all.snippets
" from all &rtp/UltiSnips directories.
"let g:UltiSnips.UltiSnips_ft_filter = {
"            \ 'default' : {'filetypes': ['all'] },
"            \ 'all' : {'filetypes': ['all'] },
"            \ 'cpp' : {'filetypes': ['cpp', 'all'], 'dir-regex': '[._]vim/UltiSnips$' },
"            \ }
" In the 'default' case the special word FILETYPE will be replaced by
" &filetype, thus ['all','FILETYPE'] will load &rtp/html.snippets if
" you're editing html files.

" choices could be nasty, never show them
"let g:UltiSnips.always_use_first_snippet = 1

" == snipmate snippets ==
" _.snippets are meant to be snippets to be loaded always which is why
" they are contained in all cases
" This is pretty much the same as above:
" * For html, xhtml snipmate &rtp/snippets/javascript snippets get loaded
" * For cpp don't load any snipmate &rtp/snippets - because in this
"   example UltiSnips snippets are preferred
"let g:UltiSnips.snipmate_ft_filter = {
"            \ 'default' : {'filetypes': ["FILETYPE", "_"] },
"            \ 'html'    : {'filetypes': ["html", "javascript", "_"] },
"            \ 'xhtml'    : {'filetypes': ["xhtml", "html", "javascript", "_"] },
"            \ 'cpp'    : {'filetypes': [] },
"            \ }
"
"
"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.
"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
"function! Tab_Or_Complete()
"  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"    return "\<C-N>"
"  else
"    return "\<Tab>"
"  endif
"endfunction
":inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
":set dictionary="/usr/share/dict/words"
"
" https://github.com/Rip-Rip/clang_complete/blob/master/README
" added clang_complete
"
" markdown
nmap <leader>md :%!/usr/bin/markdown --html4tags > "%:t:r".html <cr><esc>u
" Open markdown files with Chrome.
autocmd BufEnter *.md exe 'noremap <F6> :!chromium-browser %:p<CR>'
"
"
imap ;qq Keep going with the game, and let me know if you have any questions.
" end .vimrc
"
" nerdtree configs
map <C-n> :NERDTreeToggle<CR>

syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=Red ctermbg=2
