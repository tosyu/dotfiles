set nocompatible
syntax on
filetype plugin on
filetype indent on

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
set path+=src/**

" functions

function! _load_local_config()
	let path = expand(trim(getcwd())) . "/.vimrc.local"
	if filereadable(path)
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

function! _get_git_branch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! _get_git_branch_for_status()
	let l:branch = _get_git_branch()
	return strlen(l:branch) > 0 ? ' [' . l:branch .'] ' : ''
endfunction

if executable("rg")
	set grepprg=rg\ --vimgrep\ --hidden\ --smart-case

	function! _ripgrep_find_func(cmdarg, cmdcomplete)
		let files = systemlist("rg --files --hidden | rg " . a:cmdarg)
		return files
	endfunction

	"set findfunc=_ripgrep_find_func
endif

function! _completion_func(findstart, base) abort
	let l:result = ale#completion#OmniFunc(a:findstart, a:base);
	if (a:findstart && l:result is -3) || (!a:findstart && empty(l:result))
		return syntaxcomplete#Complete(a:findstart, a:base)
	endif
endfunction

set omnifunc=_completion_func
set completeopt-=preview

set spell spelllang=en_us
set tags=./tags,tags,.tags;$HOME
set termguicolors
set t_Co=256
colorscheme habamax

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_winsize=30

let g:smoothie_enabled=1

let g:termdebug_wide=100

set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set smarttab
set number
set relativenumber
set cursorline

set showmode
set showmatch
set showcmd
set ruler
set laststatus=2

set guioptions-=m
set guioptions-=T
set wildmenu
set mouse=a

set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,**/.git/**,**/node_modules/**

set noswapfile
set nobackup
set history=1000

set incsearch
set hlsearch

if has("autocmd") && exists("+omnifunc")
	autocmd Filetype *
		    \	if &omnifunc == "" |
		    \		setlocal omnifunc=syntaxcomplete#Complete |
		    \	endif
endif

set listchars=eol:$,tab:>-,space:.,trail:~,extends:>,precedes:<

packadd termdebug
packadd editorconfig
packadd cfilter
packadd matchit

let mapleader=" "

" key conf
nnoremap <silent> <leader>w :w<cr>
nnoremap <silent> <leader>W :w!<cr>
nnoremap <silent> <leader>e :Lexplore<cr>
nnoremap <silent> <leader>h :bprev<cr>
nnoremap <silent> <leader>j :cnext<cr>
nnoremap <silent> <leader>k :cprev<cr>
nnoremap <silent> <leader>l :bnext<cr>
nnoremap <silent> <leader>bb :make<cr>
nnoremap <silent> <leader>bc :make clean<cr>
nnoremap <silent> <leader>br :make run<cr>
nnoremap <silent> <leader>bd :Termdebug<cr>
nnoremap <silent> <leader>co :copen<cr>

nnoremap <silent> <leader>db :ToggleBreak<cr>
nnoremap <silent> <leader>dt :Tbreak<cr>
nnoremap <silent> <leader>dd :Clear<cr>
nnoremap <silent> <leader>dc :Continue<cr>
nnoremap <silent> <leader>dn :Over<cr>
nnoremap <silent> <leader>df :Finish<cr>
nnoremap <silent> <leader>dr :RunOrContinue<cr>
nnoremap <silent> <leader>du :Up
nnoremap <silent> <leader>dl :Down
nnoremap <silent> <leader>df :Frame
nnoremap <silent> <leader>dv :Var<cr>
nnoremap <silent> <leader>da :Asm<cr>
nnoremap <silent> <leader>dp :Program<cr>
nnoremap <silent> <leader>dg :Gdb<cr>
nnoremap <silent> <leader>ds :Source<cr>

" disable arrow keys
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Down> <Nop>
noremap <Up> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Down> <Nop>
noremap <Up> <Nop>

" source local .vimrc
call _load_local_config()
