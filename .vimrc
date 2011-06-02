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

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
"if has("syntax")
"  syntax on
"endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif

set nu
"set clipboard+=unnamed   " share window clipboard

set nocompatible " explicitly get out of vi-compatible mode
set noexrc " don't use local version of .(g)vimrc, .exrc
set background=dark " we plan to use a dark background
syntax on " syntax highlighting on

" Search {
set hlsearch    " highlight search result.
set incsearch   " do search as you type your search phrase
set ignorecase smartcase    " smart ignore case when searching.
" }

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

set expandtab " user space instead of tab
set tabstop=4 " set tab to four spaces
set shiftwidth=4 " 自动缩进的宽度。

"pydiction 1.2 python auto complete
filetype plugin on
let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'
let g:pydiction_menu_height = 15
let g:pydiction_menu_height = 20 

set showmode
set helplang=cn

let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>
let g:winManagerWidth = 40

:set cscopequickfix=s-,c-,d-,i-,t-,e- "set cscope

filetype plugin indent on

let g:winManagerWindowLayout='NERDTree|TagList,BufExplorer'

" Key mappings {
map q :q <CR>
map Q :qa <CR>
map W :w <CR>
map <S-Enter> o<Esc>
map <C-S-Enter> O<Esc>
inoremap <S-Enter> <ESC>$o
inoremap <C-S-Enter> <ESC>$O

inoremap <C-a> <ESC>:r!date<CR>iCalvin.Lee<lihao921@gmail.com> @ <ESC>kJA<CR>

"自动补全成对的括号和引号
"@http://blog.hotoo.me/vim-autocomplete-pairs.html
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap < <><ESC>i
inoremap > <c-r>=ClosePair('>')<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
""
" format all of text
map <C-S-f> gg=G<C-o><C-o>

" }

let g:debuggerMaxDepth = 5

" 允许backspace和光标键跨越行边界
:set whichwrap+=<,>,h,l

" 记住上次离开的的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"hignlight current line
:set cursorline

:set clipboard=unnamed

:set go+=a


"自动载入 .vimrc，修改后不需要重启
autocmd! bufwritepost .vimrc source %

function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

":set mouse=v
"
" no swap file please
:set noswapfile

:set cscopequickfix=s-,c-,d-,i-,t-,e-

:set iskeyword+=-
