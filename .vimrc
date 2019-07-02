noremap qj <Esc>
inoremap qj <Esc>

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/bundle')
  call dein#begin('~/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/bundle/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('h1mesuke/vim-alignta')
  call dein#add('elixir-editors/vim-elixir')
  call dein#add('vim-erlang/vim-erlang-runtime')
  call dein#add('nvie/vim-flake8')
  call dein#add('fatih/vim-go')
  call dein#add('rhysd/wandbox-vim')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('pangloss/vim-javascript')
  call dein#add('MaxMEllon/vim-jsx-pretty')
  call dein#add('mileszs/ack.vim')
  call dein#add('rking/ag.vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

syntax on
filetype plugin on
filetype plugin indent on

set tabstop=4
set list
set listchars=tab:\^\ ,trail:`
set number
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set hlsearch
set nobackup
autocmd FileType * set formatoptions-=ro
autocmd FileType * set autoindent
" autocmd FileType * set indentexpr&
autocmd FileType * set nocindent
autocmd FileType * set nosmartindent
autocmd FileType * set nopreserveindent
autocmd FileType make set noexpandtab

autocmd BufNewFile,BufRead *.julius set filetype=javascript
autocmd BufNewFile,BufRead *.hamlet set filetype=html

" flake8 settings
autocmd BufWritePost *.py call Flake8()
let g:flake8_cmd="flake8"

set wildmenu
set wildmode=list:longest,full

set diffopt=filler,vertical

hi JpSpace cterm=underline ctermfg=DarkGray
autocmd BufNewFile,BufRead * match JpSpace /　/

" vimgrep aliases
nnoremap <Space>fw :vimgrep /\<<C-r>=expand("<cword>")<CR>\>/j 

" Ctrl+W
map <Space>wh <C-w>h
map <Space>wj <C-w>j
map <Space>wk <C-w>k
map <Space>wl <C-w>l
map <Space>ww <C-w>w
map <Space>wH <C-w>H
map <Space>wJ <C-w>J
map <Space>wK <C-w>K
map <Space>wL <C-w>L
map <Space>wr <C-w>r
map <Space>wR <C-w>R

" highlight
"    Suggested color names (these are available on most systems):
"        Red         LightRed        DarkRed
"        Green       LightGreen      DarkGreen       SeaGreen
"        Blue        LightBlue       DarkBlue        SlateBlue
"        Cyan        LightCyan       DarkCyan
"        Magenta     LightMagenta    DarkMagenta
"        Yellow      LightYellow     Brown           DarkYellow
"        Gray        LightGray       DarkGray
"        Black       White
"        Orange      Purple          Violet
set background=dark
hi Normal     cterm=NONE ctermfg=White
hi Comment    cterm=NONE ctermfg=Cyan
hi Constant   cterm=NONE ctermfg=LightMagenta
hi Identifier cterm=NONE ctermfg=Cyan
hi Statement  cterm=NONE ctermfg=Yellow
hi PreProc    cterm=NONE ctermfg=Magenta
hi Type       cterm=NONE ctermfg=LightGreen
hi Special    cterm=NONE ctermfg=Green

syntax match TailSpaces /\s\+$/ containedin=ALL
hi TailSpaces cterm=NONE ctermbg=Red

" terminal clipboard
if !has('gui')
    " Vim(Mac)
    if has('macunix') || system('uname') =~? '^darwin'
        nnoremap <silent> <Space>y :w !pbcopy<CR><CR>
        vnoremap <silent> <Space>y :w !pbcopy<CR><CR>
        nnoremap <silent> <Space>p :r !pbpaste<CR>
        vnoremap <silent> <Space>p :r !pbpaste<CR>
    endif
" GVim(Mac & Win)
else
    noremap <Space>y "+y
    noremap <Space>p "+p
endif

set clipboard=

" erlang settings
autocmd BufNewFile,BufRead *.erl set filetype=erlang

" elixir settings
autocmd BufNewFile,BufRead *.ex,*.exs set filetype=elixir
autocmd BufNewFile,BufRead *.ex,*.exs set tabstop=2
autocmd BufNewFile,BufRead *.ex,*.exs set shiftwidth=2
autocmd BufNewFile,BufRead *.ex,*.exs set formatprg=mix\ format\ -

" vim-go settings
" :GoInstallBinaries を実行した上で、シェル上で gometalinter --install をしておくこと
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
let g:go_fmt_command = "goimports"

" clang-format
function! FormatonsaveCpp()
  let l:formatdiff = 1
  py3f /usr/local/share/clang/clang-format.py
endfunction
autocmd BufWritePre *.h,*.c,*.cc,*.cpp call FormatonsaveCpp()
