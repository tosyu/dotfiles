set nocompatible
syntax on
filetype plugin on
filetype indent on

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
set path+=**

set spell
set tags=./tags,tags,.tags;$HOME
set termguicolors
set t_Co=256
colorscheme habamax

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_winsize=30

set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set number
set relativenumber
set cursorline

set showmode
set showmatch
set showcmd

set guioptions-=m
set guioptions-=T
set wildmenu
set mouse=a

set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set noswapfile
set nobackup
set history=1000

set incsearch
set hlsearch
set omnifunc=syntaxcomplete#Complete
set completeopt-=preview

set listchars=eol:$,tab:>-,space:.,trail:~,extends:>,precedes:<

" functions

function! _load_local_config()
	let path = trim(getcwd()) . "/.vimrc"
	if filereadable(path) && path != $MYVIMRC
		execute "source " . path
	endif
endfunction

let g:ctags_args="-V -R ."
let g:ctags_command=expand("ctags")

function! _run_ctags()
	let ctags_cmd = g:ctags_command . " " . g:ctags_args
	echo ctags_cmd
	exec "!" . ctags_cmd
endfunction	

command! -nargs=0 CtagsGenerate :call _run_ctags()

let g:cmake_output="build/"
let g:cmake_command=expand("cmake")

function! _cmake_generate()
	let cmake_cmd = g:cmake_command . " -B " . g:cmake_output
	echo cmake_cmd
	exec "!" . cmake_cmd
endfunction

function! _cmake_build()
	let cmake_cmd = g:cmake_command . " --build " . g:cmake_output
	echo cmake_cmd
	exec "!" . cmake_cmd
endfunction

command! -nargs=0 CMakeGenerate :call _cmake_generate()
command! -nargs=0 CMakeBuild :call _cmake_build()

packadd termdebug

let mapleader="\\"

" key conf

" terminal 
nnoremap <silent> <leader>` :term<cr>
tnoremap <silent> <leader>` <C-\><C-n>:q!<cr>

" file stuff
nnoremap <silent> <leader>w :w<cr>
nnoremap <silent> <leader>W :w!<cr>
nnoremap <silent> <leader>e :Lexplore<cr>

" source local .vimrc
call _load_local_config()
