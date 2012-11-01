" vundle stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on

" vundle plugins
Bundle 'gmarik/vundle'
Bundle 'vim-scripts/L9.git'
Bundle 'FuzzyFinder'
Bundle 'tComment'
Bundle 'mileszs/ack.vim'
Bundle "othree/html5-syntax.vim"

" themes
Bundle "yearofmoo/Vim-Darkmate"
Bundle "yearofmoo/tomorrow-theme"
Bundle "tpope/vim-vividchalk"
Bundle "tomasr/molokai"
Bundle "vim-scripts/desert256.vim"
Bundle "vim-scripts/wombat256.vim"
Bundle "vim-scripts/moria"
Bundle "vim-scripts/darktango.vim"
Bundle "wgibbs/vim-irblack"
Bundle "nanotech/jellybeans.vim"
Bundle "jeremycw/darkspectrum"

" theme
colorscheme darkmate

" font
set guifont=Monaco:h12

" highlight the code
syntax enable
filetype plugin indent on

" Stoooopid backup files
set nobackup
set nowritebackup
set noswapfile

" highlight and partial search results
set hlsearch
set incsearch

" editor flags
set ruler
set number
set laststatus=1
set hidden
set softtabstop=2
set wildmenu
set wildmode=list:longest
set incsearch
set fuopt+=maxhorz
set ignorecase
set smartcase
set paste
set showmode
set tabstop=2
set shiftwidth=2
set expandtab

" external stuff
map <Leader>vim :e ~/.vimrc<Enter>
map <Leader>windows :ba<Enter>
map <Leader>fuf :FufRenewCache<Enter>

" displays the hep information for syntax highlighting
map <Leader>hi :help highlight-groups<Enter>

" file searching with fuzzyfile finder
map <Leader>fuf :FufRenewCache<Enter>
map <D-r> :FufFile **/<Enter>
map <D-d> :FufBuffer<Enter> 

" Main Buffers
map <D-]> :bn<Enter>
map <D-[> :bp<Enter>
map <d-1> :b1<enter>
map <d-2> :b2<enter>
map <d-3> :b3<enter>
map <d-4> :b4<enter>
map <d-5> :b5<enter>
map <d-6> :b6<enter>
map <d-7> :b7<enter>
map <d-8> :b8<enter>
map <d-9> :b9<enter>

" this hops between your previous buffers
map <D-0> :b#<Enter>

" these are shortcuts for auto indentation
nmap tt gg=G
vmap tt ngg=Gv

" file searching and buffers
nmap ss <C-w>s
nmap hh <C-w>v
nmap <S-up> <C-w><Up>
nmap <S-down> <C-w><Down>
nmap <S-left> <C-w><Left>
nmap <S-right> <C-w><Right>

" full screen
map <D-u> :set invfu<CR>

" indentation
vmap < <gv
vmap > >gv

" theme inspection
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc 

" File Type Highlighting
au BufNewFile,BufRead *.markdown set filetype=html
au BufNewFile,BufRead *.xview.erb set filetype=html.erb
au BufNewFile,BufRead *.xmodal.erb set filetype=html.erb
au BufNewFile,BufRead *.markdown.erb set filetype=html.erb

" Clear highlights
nmap <Space> :nohl<Enter>
