" @@@@@@@@@@@@@@@@@@@@@@@@@@@@%,                  .*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" @@@@@@@@@@@@@@@@@@@@@@@*                               #@@@@@@@@@@@@@@@@@@@@@@@
" @@@@@@@@@@@@@@@@@@@*         .*/(((((((((((((((/*.         #@@@@@@@@@@@@@@@@@@@
" @@@@@@@@@@@@@@@@*       ,/(((((((((((((((((((((((((((/,       *@@@@@@@@@@@@@@@@
" @@@@@@@@@@@@@#      ,/(((((((((((((((((((((((((((((((((((/.      &@@@@@@@@@@@@@
" @@@@@@@@@@@*     ./(((((((((((((((((((((((((((((((((((((((((/      #@@@@@@@@@@@
" @@@@@@@@@*     *(((((((((((((((((((((((((((((((((((((((((((((((,     #@@@@@@@@@
" @@@@@@@#     *(((((((((((((((((((((((((((((((((((((((((((((((((((,     @@@@@@@@
" @@@@@@.    */*.          .*/((((((//*,,,,,*/(((((((((((((((((((((((.    #@@@@@@
" @@@@@                                           ./((((((((((((((((((/    *@@@@@
" @@@@                                .,,,,..         ,(((((((((((((((((     @@@@
" @@@           .*///////*          ,************,.      /(((((((((((((((.   .@@@
" @@         ///////////     .,.      ***************.     /((((((((((((((.   ,@@
" @.      ,///////////.    ,,,,,,,     ****************.    *((((((((((((((    #@
" @      ////////////     ,,,,,,,,,     ****************,    .(((((((((((((/    @
"      ,////////////    .,,,,,,,,,,,    .*****************    ,(((((((((((((.   *
"     ,////////////,   .,,,,,,,,,,,,,    ,*****************    *((((((((((((/
"     /////////////    ,,,,,,,,,,,,,,,    *****************,    (((((((((((((
"    *////////////,   .,,,,,,,,,,,,,,,.   ,*****************    /((((((((((((.
"    *////////////.   ,,,,,,,,,,,,,,,,     *****************.   *((((((((((((,
"    *////////////.   ,,,,,,,,,,,,,,,      .****************.   *((((((((((((,
"    *////////////*   .,,,,,,,,,,,,,   ,.   ,***************    /((((((((((((.
"    ./////////////    ,,,,,,,,,,,.   ,,,    **************,    (((((((((((((
"     /////////////,    ,,,,,,,,,.   ,,,,,    *************    /((((((((((((.
" .   */////////////.   .,,,,,,,.   ,,,,,,.    ***********    ,((((((((((((,    @
" @    //////////////.    ,,,,,,   .,,,,,,,     ********,    ,(((((((((((/      @
" @    .//////////////,    .,,,    ,,,,,,,,,     ,*****     /((((((((((/       @@
" @@    ,///////////////           ,,,,,,,,,,      .,     .((((((((/*          @@
" @@@    ,////////////////         ,,,,,,,,,,,.                               @@@
" @@@@    ./////////////////,          ....                                  @@@@
" @@@@@     ////////////////////.                 ,/*,              .,,     @@@@@
" @@@@@@     .////////////////////////******/////////////////////////     @@@@@@@
" @@@@@@@@     ,///////////////////////////////////////////////////.     @@@@@@@@
" @@@@@@@@@@     ,///////////////////////////////////////////////.     @@@@@@@@@@
" @@@@@@@@@@@@      //////////////////////////////////////////*      @@@@@@@@@@@@
" @@@@@@@@@@@@@@       *///////////////////////////////////*       @@@@@@@@@@@@@@
" @@@@@@@@@@@@@@@@@       .*///////////////////////////*        @@@@@@@@@@@@@@@@@
" @@@@@@@@@@@@@@@@@@@@          .*//////////////**.          @@@@@@@@@@@@@@@@@@@@
" @@@@@@@@@@@@@@@@@@@@@@@@                               @@@@@@@@@@@@@@@@@@@@@@@@

" Maintainer:
"       Rahul De
"       rahul@mailbox.org
"       https://github.com/lispyclouds
"
" Derives:
"       - https://github.com/amix/vimrc
"
" Prerquisites:
"       - NeoVIM or VIM 8+
"       - https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode
"
" Instructions:
"       - Install the prerequisites
"       - Replace ~/.vimrc with this
"       - Run in commandline: vim +PlugClean +PlugInstall +qall
"       - Buy me a dunkel mass beer and enjoy!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'cespare/vim-toml', {'for': 'rust'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'hashivim/vim-terraform'
Plug 'henrik/vim-indexed-search'
Plug 'ambv/black', {'for': 'python'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dense-analysis/ale'
Plug 'elixir-editors/vim-elixir'
Plug 'tpope/vim-dispatch'
Plug 'osyo-manga/vim-over'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-ctrlspace/vim-ctrlspace'

" Lispy
Plug 'liquidz/vim-iced', {'for': 'clojure'}
Plug 'guns/vim-sexp', {'for': 'clojure'}
Plug 'liquidz/vim-iced-coc-source', {'for': 'clojure'}
Plug 'guns/vim-clojure-static', {'for': 'clojure'}
Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}

" Colorscheme
Plug 'joshdick/onedark.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=1000

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1

" Line numbering and width
set number
set relativenumber
set clipboard=unnamed
set clipboard+=unnamedplus
set updatetime=250
set cursorline " Highlight current line


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

autocmd BufEnter * EnableStripWhitespaceOnSave

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bc :Bclose<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


""""""""""""""""""""""""""""""
" => Python
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f #--- <esc>a
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def
au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#


""""""""""""""""""""""""""""""
" => JavaScript
"""""""""""""""""""""""""""""""
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> $log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f //--- PH<esc>FP2xi


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>d :GitGutterToggle<cr>
let g:gitgutter_enabled = 1
let g:gitgutter_realtime = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc plugin options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1
let g:vim_markdown_folding_disabled = 1
let g:airline#extensions#ale#enabled = 1
let g:iced_enable_default_key_mappings = v:true

if has("nvim") || has("gui_vimr")
    let g:CtrlSpaceDefaultMappingKey = "<C-space> "
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_macvim")
    set macligatures
    set guifont=JetBrainsMono\ Nerd\ Font:h16
endif

if (has("termguicolors"))
    set termguicolors
endif

" Disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Colorscheme
set background=dark
set termguicolors

colorscheme onedark

let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ripgrep stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use ripgrep if possible
if executable('rg')
    let g:ackprg = 'rg --vimgrep --smart-case'
endif

if executable("rg")
    let g:CtrlSpaceGlobCommand = 'rg --vimgrep --smart-case'
endif
