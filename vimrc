" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" echo '(>^.^<)'
" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
" set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

"modified in 2013/9/25"
set number
"tab=4blank
set cindent
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"install pathogen to manage vim plugins
execute pathogen#infect()
 
set modifiable
set ruler
set cursorline   " 十字高亮
set cursorcolumn

" shortcuts----------------------------------------------------
" ctrl+d delete line in `INSERT` mode
imap <c-d> <Esc>ddi
" crtl+s quick save
inoremap <c-s> <Esc>:update<CR>a
nnoremap <c-s> :update<CR>
" quick quit vim with tapping `Esc` 3 times in a row
nmap <Esc><Esc><Esc> :q<CR>
" convert word to upper case in `INSERT` mode
imap <c-u> <Esc>viwUea
" convert word to lower case in `INSERT` mode
imap <c-l> <Esc>viwuea
" save and quit in `INSERT` mode
imap ZZ <Esc>:wq<CR>
" shift+enter 换行到下一行行首
" inoremap ^M <CR><Esc>cc
" auto add ()
imap <F4> ()<Esc>i
" quick add shebang
map # I#!/usr/bin/env <Esc>o<CR>
" quick select word
nmap <Space> viw
" move line downward/upward 
map _ o<Esc>kddp
map + kdd
" easier moving of code blocks
map < <gv
map > >gv

"设置php函数补全
au FileType php call AddPHPFunction()
function AddPHPFunction()
    set dictionary-=~/.vim/dict/php_function dictionary+=~/.vim/dict/php_function
    set complete-=k complete+=k
endfunction

"phpcomplete
filetype plugin on
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" 设置nodejs函数补全
au FileType javascript set dictionary+=~/.vim/dict/nodejs

"NERDTree-------------------------------------------------------
"在屏幕右侧显示目录树
let NERDTreeWinPos="right"
"默认显示书签
let NERDTreeShowBookmarks=1
"<F2>调出/隐藏NERDTree
map <F2> :NERDTreeToggle<CR>
"关闭vim时,如果打开的文件只有NERDTree,NERDTree会自动关闭，减少多次按:q
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

" miniBufExplore conf-------------------------------------------
" <F7> move to pre tab, <F8> move to next tab
map <F7> :bp<CR>
map <F8> :bn<CR>

let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1

" js syntax highlighting
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
" enable js fold
let b:javascript_fold=1
" enable support js with html & css
let javascript_enable_domhtmlcss=1

"Ctags ---------------------------------------------------------
set tags+=/home/keith/github/php-src

" neocomplcache.vim 2014-08-16
let g:neocomplcache_enable_at_startup = 1

" map <silent><F3> :NEXTCOLOR<cr> 
" map <silent><F4> :PREVCOLOR<cr> 

"set t_Co=256
colorscheme luckyboy

