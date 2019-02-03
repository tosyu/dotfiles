filetype on
filetype plugin on
filetype indent on
syntax on

let g:python3_host_prog='C:/Python36/python.exe'
let g:python_host_prog='C:/Python27/python.exe'

" =============== FUNCTION DEFS =====
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
let g:make_spc_chars_visible = 1
func! MakeHiddenCharsVisible()
  if g:make_spc_chars_visible
    set list
    let g:make_spc_chars_visible = 0
  else
    set nolist
    let g:make_spc_chars_visible = 1
  endif
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
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

call plug#begin('c:\nvim-plugged')
Plug 'HerringtonDarkholme/yats.vim'
if has("python")
  Plug 'Shougo/deoplete.nvim'
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'zchee/deoplete-jedi'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
	Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
	Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
  Plug 'Shougo/denite.nvim'
endif
if v:version >= 800
  Plug 'w0rp/ale'
endif
if executable('git')
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
endif
if executable('ctags')
  Plug 'majutsushi/tagbar'
  Plug 'craigemery/vim-autotag'
endif
  Plug 'mxw/vim-jsx'
  Plug 'leshill/vim-json'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'groenewege/vim-less'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'MarcWeber/vim-addon-local-vimrc'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'lilydjwg/colorizer'
  " color schemes
  Plug 'morhetz/gruvbox'
call plug#end()

let mapleader=" "
let g:mapleader = " "

" Persistent Undo
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has("win32") || has("win64")
  silent !mkdir ~/vimfiles/backups > /dev/null 2>&1
  set undodir=~/vimfiles/backups
else
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
endif

if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

if has('gui_running')
  set guifont=Consolas:h11
  
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
endif

" turn hybrid line numbers on
set number relativenumber
set nu rnu

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set colorcolumn=100
set tags=./tags;,tags;

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden
set hid

"turn on syntax highlighting
syntax on


set ruler
set smartcase
set ignorecase
set hlsearch
set magic
set showmatch
set noerrorbells
set novisualbell
set lazyredraw
set ttyfast
set showmatch
set mat=2
set t_vb=
set tm=500
set nomousehide
set shellslash
set mouse=a


" show invisible chars
set lcs=tab:»\ ,trail:.,eol:$,nbsp:_
" set encoding to utf8 and default file type to unix

set encoding=utf8 nobomb
set ffs=unix,dos,mac

set cmdheight=1
set laststatus=2

" Turn Off Swap Files
"
set noswapfile
set nobackup
set nowb
set undofile

" Indentation
set autoindent
set shiftwidth=2
set tabstop=2

" Display tabs and trailing spaces visually
" set list listchars=tab:\ \ ,trail:·
"
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" Folds
set foldmethod=indent   "fold based on indent
set foldnestmax=10       "deepest fold is 3 levels
set foldlevel=99
set foldignore=
set nofoldenable        "dont fold by default

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML
let g:markdown_folding=1

" Scrolling
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" buffer switching behavior
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

set viminfo^=%

" tabline
set showtabline=1

nmap <F8> :TagbarToggle<CR>
nmap <leader>m <Plug>ToggleMarkbar
nmap <leader>pp :setlocal paste!<cr> " disable paste mode
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>
nmap <leader>cc :botright cope<cr>
nmap <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
nmap <leader>n :cn<cr>
nmap <leader>p :cp<cr>
nmap <leader>ll :lw<cr>
nmap <leader>cw :cw<cr>

nmap <leader>q :bd<cr>
nmap <leader>Q :q<cr>
nmap <leader>w :w!<cr>
nmap <leader>c :noh<cr>
nmap <leader>t :call DeleteTrailingWS()<cr>

inoremap <F7> <C-O>za
nnoremap <F7> za
onoremap <F7> <C-C>za
vnoremap <F7> zf
map <leader>j :e <cfile><cr>
map <leader>e :Errors<cr>

" toggle special chars
map <leader>h :call MakeHiddenCharsVisible()<cr>

" write with sudo
map <leader>sw :w !sudo tee %<CR>

" buffers
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" close current buffer
nmap <leader>bd :Bclose<cr>
nmap <silent> <C-M-w> :Bclose<cr>
" close all buffers
map <leader>ba :bufdo bd!<cr>
map <leader>bn :bnext<cr>
map <leader>bp :bprevious<cr>
nmap <silent> <C-h> :bprevious<CR>
nmap <silent> <C-l> :bnext<CR>
nmap <silent> <C-j> :tabprev<CR>
nmap <silent> <C-k> :tabnext<CR>


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

" tabs
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>
map <leader>tc :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tq :tabclose<cr>
map <leader>tm :tabmove
map <leader>tj :tabedit <cfile><cr>
" opens new tab with current buffer
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" update cwd to current buffers path
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" autocmd conf
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript

set background=dark
colorscheme gruvbox
set t_Co=256

let g:autotagDisabled=''
let g:local_vimrc = {'names':['.vimrc'],'hash_fun':'LVRHashOfFile'}
let g:ale_sign_column_always = 1
let g:used_javascript_libs = ''

" omnifuncs
"augroup omnifuncs
  "autocmd!
  "autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  "autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  "autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  "autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  "autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"augroup end
" tern
"if exists('g:plugs["tern_for_vim"]')
  "let g:tern_show_argument_hints = 'on_hold'
  "let g:tern_show_signature_in_pum = 1
  "autocmd FileType javascript setlocal omnifunc=tern#Complete
"end


" Completion
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,*.pyc "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

if has("python")
	let g:deoplete#enable_at_startup = 1
	let g:deoplete#enable_auto_complete = 1
	let g:deoplete#smart_case = 1
	let g:deoplete#yarp = 1
	if !exists('g:deoplete#omni#input_patterns')
		let g:deoplete#omni#input_patterns = {}
	endif
	autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
	"call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])
endif

" silver searcher config
if executable('ag')
    " as grep
    " set grepprg=ag\ --nogroup\ --nocolor
    set grepprg=ag\ --vimgrep\ $*
    set grepformat=%f:%l:%c:%m
    map <leader>g :grep "" <left><left>
    map <leader><space> :grep "" %<left><left><left>

    map <silent> <C-p> :DeniteProjectDir -buffer-name=git -direction=top buffer file_rec/git<CR>
    map <silent> <C-M-p> :DeniteProjectDir buffer -buffer-name=files -direction=top file_rec<CR>

    " denite ag conf
    if has('python')
        call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-u', '-g', ''])
        call denite#custom#alias('source', 'file_rec/git', 'file_rec')
        call denite#custom#var('file_rec/git', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
    endif
else
  " default for denite
  map <silent> <C-p> :Denite buffer file/rec<CR>
  map <silent> <C-M-p> :DeniteProjectDir buffer file/rec<CR>

  " default for grep
  map <leader>g :grep "" **/*<left><left><left><left><left><left>
  map <leader><space> :grep "" %<left><left><left>
endif

let g:ale_sign_error = 'X'
let g:ale_sign_Warn = '!'

highlight ALEWarningSign ctermfg=Yellow  ctermbg=None
highlight ALEErrorSign ctermfg=Red ctermbg=None

let g:colorizer_nomap = 1
