" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" set compatible

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
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set nu
set shiftwidth=4	" 使用缩进的空格数
set tabstop=4		" 一个Tab代表的空格数
set expandtab		" 在缩进时碰到Tab时用空格代替
set cursorcolumn
set splitright

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" 2015-01-01 self define
" Learn vim script the hard way

" change the key of quit insert mode
inoremap jk <Esc>
inoremap <C-d> <Esc>ddO
"noremap <C-s> <Esc>:w<CR>

" open vimrc in current window
nnoremap <Leader>ev <Esc>:vsplit $MYVIMRC<CR>
nnoremap <Leader>sv <Esc>:source $MYVIMRC<CR>

" () {} [] '' \"" 自动补全
" inoremap ( ()<Esc>i
" inoremap [ []<Esc>i
" inoremap { {}<Esc>i
" inoremap ' ''<Esc>i
" inoremap " ""<Esc>i

" Python config
augroup filetype_py
    autocmd FileType python iabbrev newpy #!/usr/bin/python<CR># -*- encoding: utf-8 -*-<CR>
augroup END

" javascript config
augroup filetype_js
	autocmd FileType javascript set shiftwidth=4
augroup END

" Status line
set statusline=%f\ :)

" Color scheme
colorscheme lufeng
let g:rehash256=1

" install pathogen
execute pathogen#infect()

" **************************** NerdTree config *****************************
" 在屏幕右侧显示目录树
let NERDTreeWinPos="right"
"默认显示书签
let NERDTreeShowBookmarks=1
map <F2> :NERDTreeToggle<CR>
" 退出vim时，如果NERDTree未关闭，自动关闭
autocmd bufenter * if (winnr("$")==1 && exists("b:NERDTreeType") && b:NERDTreeType=="primary") | q | endif

" *************************** neocomplcache conf ***************************
let g:neocomplcache_enable_at_startup=1

" "let currentChar=getchar(".")[col(".") - 1]

"autocmd CursorMovedI * :echom getchar(".")[col(".") - 1]
"inoremap <Enter> `c`

" gtk+ syntax hilighting
"let glib_enable_deprecated = 1

" easier moving of code block
noremap < <gv
noremap > >gv

" CtrlP plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map="<c-p>"

" tmux env color conf
if exists('$TMUX')
  set term=screen-256color
endif

" set ejs file highlighting
au BufNewFile,BufRead *.ejs set filetype=html
