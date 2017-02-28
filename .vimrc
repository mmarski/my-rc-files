" Set up Vundle:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Syntax checking hacks for vim
Plugin 'scrooloose/syntastic'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'ctrlpvim/ctrlp.vim'

" All-in-one colorschemes
Plugin 'flazz/vim-colorschemes'

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
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve remov$
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" let g:syntastic_c_no_include_search = 1
" let g:syntastic_c_remove_include_errors = 1
let g:syntastic_cpp_no_include_search = 1
let g:syntastic_cpp_remove_include_errors = 1
" let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_include_dirs = ['../inc','../../inc/cli','../../inc/connection','/repo/eteivma/mmgw/mrfp_appl/inc','$MMGW_GIT_REPO/virtual_common/trace/inc/']

syntax on
set expandtab
set tabstop=4
set shiftwidth=4
set textwidth=79
set title
set nu
set hlsearch
set backspace=indent,eol,start
set cursorline
set autochdir
" HTML
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" Statusline
set laststatus=2
set statusline=
set statusline+=%{ColHilight()}
set statusline+=%1*
set statusline+=%4v,
set statusline+=%2*
set statusline+=%4l\ of\ %L
set statusline+=\ \ 
set statusline+=%4*
set statusline+=\ %{GetMode()}
set statusline+=%3*
set statusline+=\ \ %=
set statusline+=%<%F%m%r%h%w\ [%Y]
" set statusline=%f%m%r%h%w\ [%Y]\ %F%4v,%4l\ %3p%%\ of\ %L
hi User1 cterm=bold
hi User2 ctermfg=cyan ctermbg=darkgray
hi User3 ctermfg=green ctermbg=black
hi User4 ctermfg=cyan ctermbg=blue

let g:currentmode={
    \ 'n'  : 'N ',
    \ 'no' : 'N·Operator Pending ',
    \ 'v'  : 'V ',
    \ 'V'  : 'V·Line ',
    \ '' : 'V·Block ',
    \ 's'  : 'Select ',
    \ 'S'  : 'S·Line ',
    \ '^S' : 'S·Block ',
    \ 'i'  : 'INS ',
    \ 'R'  : 'R ',
    \ 'Rv' : 'V·Replace ',
    \ 'c'  : 'Command ',
    \ 'cv' : 'Vim Ex ',
    \ 'ce' : 'Ex ',
    \ 'r'  : 'Prompt ',
    \ 'rm' : 'More ',
    \ 'r?' : 'Confirm ',
    \ '!'  : 'Shell ',
  \ 't'  : 'Terminal '
    \} " ctrl-K ctrl-V tekee special characteri

function! ColHilight()
    if col('.') > 79 " . = the cursor position, :help internal-variables
        exe 'hi! User1 ctermbg=red ctermfg=yellow'
    else
        exe 'hi! User1 ctermbg=white ctermfg=black'
    endif
    "if mode() ==# 'i'
    "    return "INSERT"
    return ''
endfunction

function! GetMode()
    if mode() ==# 'i'
        exe 'hi! User4 ctermfg=blue ctermbg=yellow'
    else
        exe 'hi! User4 ctermfg=cyan ctermbg=blue'
    endif
    return g:currentmode[mode()]
endfunction

" Syntastic noob settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Remaps
nnoremap H gT
nnoremap L gt
