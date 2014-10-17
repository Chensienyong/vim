set nocompatible "enable system-wide vimrc support from user(s) .vimrc
set backspace=indent,eol,start "enable backspace function
syntax on "enable syntax highlighting

"vundle configuration
""--------------------
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"plugin manager
""--------------
Bundle 'gmarik/vundle'

"file browser
""------------
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'

"automatic closing bracket(s), parenthesis(es), quote(s)
""-------------------------------------------------------
Bundle 'Raimondi/delimitMate'

"browsing tag(s) in source code
""------------------------------
Bundle 'majutsushi/tagbar'

"snipmate plugins
""----------------
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'

"vim zen coding style
""--------------------
Bundle 'mattn/emmet-vim'

"vim python plugin(s)
""--------------------
Bundle 'klen/python-mode'

"color scheme(s)
""---------------
Bundle 'flazz/vim-colorschemes'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'joedicastro/vim-molokai256'

"adding nginx syntax highlight
""-----------------------------
Bundle 'evanmiller/nginx-vim-syntax'

"css3 syntax highlight
""---------------------
Bundle 'lepture/vim-css'

"twig syntax highlighting, snipMate, etc.
""---------------------
Bundle 'evidens/vim-twig'

"function(s)
""-----------
function! MakeDirIfNotExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path), "p")
    endif
endfunction

"visual configuration(s)
""-----------------------
set t_Co=256 "enable 256-color vim support
let g:kolor_italic=1
let g:kolor_bold=1
let g:kolor_underlined=0
let g:kolor_alternative_matchparen=0
colorscheme kolor

set laststatus=2 "show last status for vim-airline plugin
set nowrap "disable text-wrapping
set number "show line number
set numberwidth=4 "line number column width is 4 space(s)
set showmatch "highlight matching bracket(s) / parenthesis(es)
set wildmenu "show file(s) available for edit above command-block"

"hide file with these extension(s)
""---------------------------------
set wildignore+=*.sw?
set wildignore+=*.bak,*.~
set wildignore+=*.luac
set wildignore+=*.jar
set wildignore+=*.pyc
set wildignore+=*.stats

"re-map the vim <leader> key
""---------------------------
let mapleader=","
let g:mapleader=","

filetype plugin on "enable file detection and load its plugin file
filetype indent on "enable file detection and load its indent file

"vim tab configuration
""---------------------
set tabstop=4 "4 space(s) in a single tab
set softtabstop=4 "make backspace delete 4 space(s) at once
set shiftwidth=4 "use with < and > for block indenting"
set expandtab "use space(s) instead of tab(s)
set autoindent "indent new lines the same as previous one

"vim tab-length exceptions
""-------------------------
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType css setlocal shiftwidth=4 tabstop=4 softtabstop=4

"vim syntax-highlight
""--------------------
au BufNewFile,BufRead *.html setlocal filetype=htmldjango
au BufNewFile,BufRead *.twig setlocal filetype=twig

"vim history configuration
""-------------------------
set backup "set nobackup files
set noswapfile "set no swap(*.~) file
set history=1000 "set larger undo/redo memory
set undofile "set persistent history
set undoreload=1000 "save the whole buffers for undo when reloading
set backupdir=$HOME/.vim/tmp/backup/ "set backup storage directory
set undodir=$HOME/.vim/tmp/undo/ "set history storage directory

"make the dir(s) if it isn't exists
""----------------------------------
silent! call MakeDirIfNotExists(&backupdir)
silent! call MakeDirIfNotExists(&undodir)

"vim searching configuration(s)
""------------------------------
set ignorecase "searching with non case-sensitve approach
set incsearch "highlight matches while searching
set smartcase "search smarter way

"reload vimrc when its saved
""---------------------------
autocmd! BufWritePost ~/.vimrc source ~/.vimrc

"key-map for tab(s) navigation
""-----------------------------
map tn :tabn<CR>
map tp :tabp<CR>

"copy/cut/paste into/from clipboard
""----------------------------------
map <leader>x "+x
map <leader>y "+y
map <leader>p "+p

"moving windows cursor focus
""---------------------------
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

"disable arrow key(s) in normal mode
""-----------------------------------
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"disable arrow key(s) in insert mode
""-----------------------------------
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"plugin(s) configuration(s)
""--------------------------
let NERDTreeIgnore=['\.o$', '\.pyc$'] "filter file(s) that shown at nerdtree

map <F3> :NERDTreeToggle<CR>
map <F4> :TagbarToggle<CR>

"configuration running gvim
""--------------------------
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
    set guifont=Monaco\ 10
endif

"python mode configuration(s)
""----------------------------
let g:pymode_folding=0 "disable python code folding at default
let g:pymode_rope=0 "disable python-mode rope autocomplete
let g:pymode_breakpoint=0 "disable python-mode breakpoint plugins

let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all

let g:pymode_lint=1
let g:pymode_lint_checker='pyflakes,pep8'
let g:pymode_lint_write=1

let g:pymode_lint_ignore="E122,E501"

"php check
""---------
map <F5> :!php -l %<CR>
