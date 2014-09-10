" config "
set shell=/bin/zsh\ -i

" vundle stuff "
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'danro/rename.vim'
Plugin 'epmatsw/ag.vim'
Plugin 'embear/vim-localvimrc'
Plugin 'vim-scripts/taglist.vim'
Plugin 'othree/html5-syntax.vim'
"Plugin 'airblade/vim-gitgutter'"
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'mattn/emmet-vim'

" Seldom Used "
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tComment'
Plugin 'xolox/vim-session'

" Deps "
Plugin 'tpope/vim-eunuch'
Plugin 'mattn/webapi-vim'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'xolox/vim-misc'

" Clojure "
 Plugin 'guns/vim-clojure-static' 
 Plugin 'tpope/vim-fireplace' 
 Plugin 'tpope/vim-classpath' 

" themes "
 Plugin 'yearofmoo/Vim-Darkmate' 
 Plugin 'yearofmoo/tomorrow-theme' 
 Plugin 'tpope/vim-vividchalk' 
 Plugin 'tomasr/molokai' 
call vundle#end()

" highlight the code
syntax enable
filetype plugin indent on

" theme
colorscheme darkmate

" font
set guifont=Monaco:h22

" line wrapping
set wrap
set linebreak
set nolist  " list disables linebreak

" Stoooopid backup files "
set nobackup
set nowritebackup
set noswapfile

" highlight and partial search results "
set hlsearch
set incsearch

" editor flags "
set ruler
set number
set laststatus=1
set hidden
set softtabstop=2
set wildmenu
set wildmode=list:longest
set incsearch
set ignorecase
set smartcase
set paste
set showmode
set tabstop=2
set shiftwidth=2
set expandtab

" Clear highlights "
nmap <Space> :nohl<Enter>

" external stuff
map <Leader>vim :e ~/.vimrc<Enter>
map <Leader>windows :ba<Enter>
map <Leader>spell :e ~/.vim/spell/en.utf-8.add<Enter>

" full screen
map <Leader>full :set invfu<CR>

" displays the hep information for syntax highlighting
map <Leader>hi :help highlight-groups<Enter>

" file searching with CTRLP
map <Leader>fuf :CtrlPClearCache<Enter>
map <D-r> :CtrlP<Enter>
map <D-d> :CtrlPBuffer<Enter>

let g:multi_cursor_prev_key='<C-m>'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components\|tmp\|build'
let g:localvimrc_ask = 0

" this hops between your previous buffers "
map <Leader>bb :e ./joasjdoajsdoajsdoja<CR>:bd<CR>

" file searching and buffers "
nmap <S-up> <C-w><Up>
nmap <S-down> <C-w><Down>
nmap <S-left> <C-w><Left>
nmap <S-right> <C-w><Right>

" indentation "
vmap < <gv
vmap > >gv

" theme inspection "
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc 

" File Type Highlighting
au BufNewFile,BufRead *.markdown set filetype=html
au BufNewFile,BufRead *.markdown.erb set filetype=html.erb
au BufNewFile,BufRead *.clj set syn=clojure
au BufNewFile,BufRead *.dart set syn=dart

" Formatting "
vmap \x :%!tidy -q -i --show-errors 0<CR>

setlocal spell spelllang=en
set spell spelllang=en
set spellfile=~/.vim/spell/en.utf-8.add

" airline
set laststatus=2

if has("autocmd")
  let pandoc_html = "pandoc --from=html --to=markdown | pandoc --from=markdown --to=html"
  autocmd FileType html let &formatprg=pandoc_html
endif

nnoremap <Leader>h :'[,']call HtmlEscape()<CR>
vnoremap <Leader>h :call HtmlEscape()<CR>

function HtmlEscape()
  silent s/&/\&amp;/eg
  silent s/</\&lt;/eg
  silent s/>/\&gt;/eg
  silent s/"/\&guot;/eg
endfunction
