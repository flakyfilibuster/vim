""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" ultisnips
Plug 'SirVer/ultisnips'

" vim themes
Plug 'tyrannicaltoucan/vim-quantum'

" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" auto-completion for quotes, parens, brackets
Plug 'Raimondi/delimitMate'

" quick commenting of code
Plug 'scrooloose/nerdcommenter'

" bottom status bar
Plug 'bling/vim-airline'

" show linechanges next to line number
Plug 'airblade/vim-gitgutter'

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" git wrapper
Plug 'tpope/vim-fugitive'

" Gbrowse github
Plug 'tpope/vim-rhubarb'

" nerdtree tree view
Plug 'scrooloose/nerdtree'

" easy-motion
Plug 'easymotion/vim-easymotion'

" emmet
Plug 'mattn/emmet-vim'

" A Vim plugin that always highlights the enclosing tags
Plug 'Valloric/MatchTagAlways'

" syntax plugins
Plug 'sheerun/vim-polyglot'
Plug 'ianks/vim-tsx'

" intellisense
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}


" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General VIM settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Space is my leader!
let mapleader = "\<Space>"

" toggle paste mode
nnoremap <leader>p :set paste!<cr>:set paste?<cr>

" writing 'xtime' will be replaced with a timestamp
iab xtime <c-r>=strftime("%H:%M")<cr>

" Enable matchit.vim,
" which ships with Vim but isn't enabled by default somehow
runtime macros/matchit.vim

"paste shit
:imap <D-V> ^O"+p

" show signcolumn at all times
:set signcolumn=yes


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
if !has('nvim')
  set ttyscroll=3
endif

"avoid scrolling problems"
set lazyredraw

"syntax highlighting
syntax on

"clipboard
set clipboard=unnamed

"colorscheme
""""""""""""""""""
color quantum

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
set colorcolumn=100

"displays line numbers
set number

"converts tabs to spaces
set expandtab

"incremental search: search begins while typing
set incsearch

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

" remap ESC to Ctrl+[ - touchbar and such
imap <C-[> <esc>

" vim-jsx should also work for .js extension
let g:jsx_ext_required = 0

" newline without entering insert mode
:nnoremap <NL> i<CR><ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF config

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" does a search, respecting .gitignore
nnoremap <c-p> :GFiles<cr>


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

" toggle
map <C-n> :NERDTreeToggle<CR>

" show hidden files
let NERDTreeShowHidden=1

" Filehighlighting
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('md', 'NONE', 'NONE', '#0184bc', 'NONE')
call NERDTreeHighlightFile('yml', 'yellow', 'none', '#a626a4', 'NONE')
call NERDTreeHighlightFile('config', 'yellow', 'none', '#50a14f', 'NONE')
call NERDTreeHighlightFile('conf', 'yellow', 'none', '#50a14f', 'NONE')
call NERDTreeHighlightFile('json', 'yellow', 'none', '#e45649', 'NONE')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', 'NONE')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', 'NONE')
call NERDTreeHighlightFile('js', 'NONE', 'NONE', '#c18401', 'NONE')
call NERDTreeHighlightFile('ts', 'NONE', 'NONE', '#00c6aa', 'NONE')
call NERDTreeHighlightFile('tsx', 'NONE', 'NONE', '#00eeff', 'NONE')


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
" UltiSnip config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

nmap <leader>dd <Plug>(coc-definition)
nmap <leader>dr <Plug>(coc-references)
nmap <leader>dj <Plug>(coc-implementation)
nmap <leader>dt <Plug>(coc-type-definition)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ripgrep config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use ripgrep with fzz as :grep
if executable('rg')
  set grepprg=rg\ --vimgrep
endif

" automatically open Quickfix with results
augroup myvimrc
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MatchTagAlways
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mta_filetypes = {
    \'typescript.tsx': 1,
    \'javascript.jsx': 1,
    \ 'html' : 1,
    \ 'xml' : 1,
\}

let g:mta_use_matchparen_group = 0
let g:mta_set_default_matchtag_color = 0

highlight MatchTag ctermfg=white ctermbg=NONE guifg=white guibg=NONE
