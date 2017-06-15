" Only after https://github.com/amix/vimrc has been installed.

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'bhurlow/vim-parinfer'
Plugin 'jceb/vim-orgmode'
Plugin 'rust-lang/rust.vim'
Plugin 'jreybert/vimagit'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'udalov/kotlin-vim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'luochen1990/rainbow'
Plugin 'airblade/vim-gitgutter'

call vundle#end()

set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

set nu
set clipboard=unnamed
set updatetime=250
set colorcolumn=80
set textwidth=74
set formatoptions=at1
let g:NERDTreeWinPos = "left"

filetype plugin on

if has("gui_macvim")
    set macligatures
    set guifont=Fira\ Code:h17
endif

let NERDTreeShowHidden=1

let g:rustfmt_autosave = 1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_show_hidden = 1
let g:rainbow_active = 1
let g:gitgutter_enabled = 1
let g:gitgutter_realtime = 1

let mapleader = "\<Space>"

map <leader>f :NERDTreeFind<CR>
map <leader>n :NERDTreeToggle<CR>

autocmd BufEnter * EnableStripWhitespaceOnSave
