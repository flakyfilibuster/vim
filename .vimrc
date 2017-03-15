""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" auto-completion for quotes, parens, brackets
Plug 'Raimondi/delimitMate'

" quick commenting of code
Plug 'scrooloose/nerdcommenter'

" git vim plugin
Plug 'tpope/vim-fugitive'

" bottom status bar
Plug 'bling/vim-airline'

" show linechanges next to line number
Plug 'airblade/vim-gitgutter'

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" nerdtree tree view
Plug 'scrooloose/nerdtree'

" easymotion
Plug 'easymotion/vim-easymotion'

" vim quantum theme
Plug 'tyrannicaltoucan/vim-quantum'

" typescript
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi'

" syntax plugins
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'

" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General VIM settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Space is my leader!
let mapleader = "\<Space>"

" Enable matchit.vim, which ships with Vim but isn't enabled by default
" " somehow
runtime macros/matchit.vim

"paste shit
:imap <D-V> ^O"+p

"force me to think VIM
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

:set list
:set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

"more colorz
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" For Vim 8.0+
if has("termguicolors")
    set termguicolors
endif

"automatically scroll text into view, so that search hits always have some
"context" lines before and after
set scrolloff=3

"MAKE VIM FASTER
"faster terminal
set ttyfast
set ttyscroll=3

"avoid scrolling problems"
set lazyredraw

"syntax highlighting
syntax enable

"colorscheme
""""""""""""""""""
colorscheme quantum

"let netrw ignore swapfile
let g:netrw_list_hide= '.*\.swp$'

" Highlight found items
set hlsearch

" Clear highlighting on escape in normal mode
 nnoremap <esc> :noh<return><esc>
 nnoremap <esc>^[ <esc>^[]

" Backup
set undofile
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set backup
set noswapfile

"highlights line that cursor is in
set cursorline

"visual reminder of line length
set colorcolumn=80

"displays line numbers
set number

"converts tabs to spaces
set expandtab

"incremental search: search begins while typing
set incsearch

"case insensitive search
set ignorecase
set smartcase

"Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

"stupid indent: copy the indentation from the previous line
set autoindent

"It hides buffers instead of closing them. This means that you can have
"unwritten changes to a file and open a new file using :e, without being
"forced to write or undo your changes first.
set hidden

"WIIIILD!
set wildmenu
set wildmode=list:longest

"use visual bell instead of beeping.... thank zeus
set visualbell

"show what I've been typing
:set showcmd

"automatically inserts one extra level of indentation in some cases, and works for C-like files
set smartindent

"encoding and such
set encoding=utf-8

"cool cursoring yo!
hi CursorLine   cterm=NONE

filetype plugin indent on

"set directory list style to 'tree'
let g:netrw_liststyle= 3

"enable statusline which shows filename/path and current line and column
set laststatus=2

"show line/column number in statusbar
set ruler

"turn off line wrapping
set nowrap

" tabbehavior
set tabstop=2
set softtabstop=2
set shiftwidth=2

" make backspace work like most other apps
set backspace=2

"show matches while I search
set showmatch

"highlight search finds
set hlsearch

"remove search highlighting
nnoremap <leader><space> :noh<cr>

"tab to matched bracket pairs
nnoremap <tab> %
vnoremap <tab> %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF config

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-p> :FZF<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdcommenter config

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" show hidden files
let NERDTreeShowHidden=1

" Filehighlighting
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#263238')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#263238')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#263238')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#263238')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#263238')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#263238')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#263238')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#263238')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab behaviour - needed to change from t to f, because netrw

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprev<CR>
nnoremap <C-n> :tabnew<CR>
nnoremap <C-j> :tabm 0<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Store swapfiles in .vim/tmp folder

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove trailing whitespace on save

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Aliases

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:command Gw Gwrite
:command Gc Gcommit
:command Gp Gpush
:command Gb Gblame


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline - vim statusbar plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_powerline_fonts = 0
let g:Powerline_symbols = 'fancy'
let g:airline_theme='quantum'
let g:quantum_italics = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gitgutter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" javascript-libraries-syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:used_javascript_libs = 'underscore,backbone,jquery,angularjs,react,jasmine,handlebars'

let g:jsx_ext_required = 0

