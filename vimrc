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

" =============== BASIC =============

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if has("win32") || has("win64") 
  if filereadable(expand("~/_vimrc.before"))
    source ~/.vimrc.before
  endif
else
  if filereadable(expand("~/.vimrc.before"))
    source ~/.vimrc.before
  endif
endif

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden
set hid

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","
let g:mapleader = ","

set ruler
set smartcase
set ignorecase
set hlsearch
set magic
set showmatch
set noerrorbells
set novisualbell
set lazyredraw
set showmatch
set mat=2
set t_vb=
set tm=500
set nomousehide
set shellslash

" show invisible chars
set lcs=tab:>\ ,trail:-,eol:$,nbsp:_
" set encoding to utf8 and default file type to unix

set encoding=utf8 nobomb
set ffs=unix,dos,mac

set cmdheight=1

set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ %{fugitive#statusline()}\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Turn Off Swap Files
"
set noswapfile
set nobackup
set nowb

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
set undofile

" Indentation

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
" set list listchars=tab:\ \ ,trail:·
"
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" Folds

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

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
set showtabline=0


" vundle

if has("win32") || has("win64")
  set rtp+=~/vimfiles/bundle/vundle
else
  set rtp+=~/.vim/bundle/vundle/
endif
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'hallettj/jslint.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-scripts/taglist.vim'
Bundle 'majutsushi/tagbar'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'ciaranm/detectindent'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
Bundle 'vim-scripts/molokai'
Bundle 'Lokaltog/vim-powerline'
Bundle 'pangloss/vim-javascript'
Bundle 'mattn/zencoding-vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'skammer/vim-css-color'
Bundle 'scrooloose/nerdtree'
Bundle 'lunaru/vim-less'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'

" unite conf
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#set_profile('files', 'smartcase', 1)
call unite#custom#source('line,outline','matchers','matcher_fuzzy')

let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_rec_max_cache_files=5000
let g:unite_prompt='» '

let g:ackprg = 'ag --nogroup --nocolor --column'
let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
let g:unite_source_grep_recursive_opt=''

" tagbar conf"

let g:tagbar_type_css = {
  \ 'ctagstype' : 'css',
  \ 'kinds'     : [
  \ 'c:classes',
  \ 's:selectors',
  \ 'i:identities'
  \ ]
\ }

let g:cssColorVimDoNotMessMyUpdatetime = 1

" let g:tagbar_type_javascript = {
"   \ 'ctagsbin' : '/usr/local/bin/jsctags'
" \ }

let g:tagbar_type_markdown = {
  \ 'ctagstype' : 'markdown',
  \ 'kinds' : [
    \ 'h:Heading_L1',
    \ 'i:Heading_L2',
    \ 'k:Heading_L3'
    \ ]
\ }


" autocmd conf
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufReadPost * :DetectIndent
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" ============== KEY MAPPINGS ===========

" disable paste mode
map <leader>pp :setlocal paste!<cr>

map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
map <leader><space> :vimgrep //<C-R>%<C-A><right><right><right><right><right><right><right><right><right>
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

map <leader>q :e ~/buffer<cr>
map <leader>w :w!<cr>
map <leader>cp :CtrlP<cr>
map <leader>cpb :CtrlPBuffer<cr>
map <leader>cpm :CtrlPMixed<cr>

" toggle special chars
map <leader>h :call MakeHiddenCharsVisible()<cr>

" buffers
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" close current buffer
map <leader>bd :Bclose<cr>
nmap <silent> <C-M-w> :Bclose<cr>
" close all buffers
map <leader>ba :1,1000 bd!<cr>
map <leader>bn :bnext<cr>
map <leader>bp :bprevious<cr>

" tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
nmap <silent> <C-right> :tabnext<cr>
nmap <silent> <C-left> :tabprevious<cr>
" opens new tab with current buffer
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" update cwd to current buffers path
map <leader>cd :cd %:p:h<cr>:pwd<cr>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :NERDTreeToggle<CR>

" UNITE
nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <space>/ :Unite grep:.<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>

" ============== UI CONF ================

if has("gui_running")
  set guioptions-=T
  set guioptions-=e
  set guioptions-=m
  set guioptions-=r
  set guioptions-=R
  set guioptions-=L
  set guioptions-=l
  set guioptions-=b
  set guitablabel=%M\ %t
  if has("win32") || has("win64")
    set guifont=Inconsolata:h12
  else
    set guifont=Inconsolata\ 12
  endif 
else
  let g:solarized_termtrans=1
endif

set background=dark
colors solarized

