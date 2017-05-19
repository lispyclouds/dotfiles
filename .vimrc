set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'cespare/vim-toml'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'bhurlow/vim-parinfer'
Plugin 'jceb/vim-orgmode'
Plugin 'rust-lang/rust.vim'
Plugin 'jreybert/vimagit'
Plugin 'ctrlpvim/ctrlp.vim'

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

set guifont=Hack:h16
set nu
set clipboard=unnamed

filetype plugin on

let NERDTreeShowHidden=1
let g:rustfmt_autosave=1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'c'

set listchars=tab:>-,trail:-
set list

