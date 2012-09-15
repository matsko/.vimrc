set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" theme
colorscheme Tomorrow-Night-Bright

" vundle stuff
Bundle 'FuzzyFinder'
Bundle 'tComment'
Bundle 'html5'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/L9.git'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'

filetype plugin indent on

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

" show the stats
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
map <Leader>www :e /www<Enter>
map <Leader>vim :e ~/.vimrc<Enter>
map <Leader>git :!g "cross check previous update"<Enter>
map <Leader>cap :!cap deloy:cold<Enter>
map <Leader>windows :ba<Enter>
map <Leader>x ggVGd<Esc><Enter> 
map <Leader>fuf :FufRenewCache<Enter>

" displays the hep information for syntax highlighting
map <Leader>hi :help highlight-groups<Enter>
map <Leader>fuf :FufRenewCache<Enter>

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
map <D-r> :FufFile **/<Enter>
map <D-d> :FufBuffer<Enter> 
nmap <tab> :FufBuffer<Enter> 
map <A-tab> :FufFile **/<Enter>
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

" multifile search
nmap <D-/> :Ack 

" theme creation command
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc 

" File Type Highlighting
au BufNewFile,BufRead *.fold.erb set filetype=html.erb
au BufNewFile,BufRead *.modal.erb set filetype=html.erb
au BufNewFile,BufRead *.xview.erb set filetype=html.erb
au BufNewFile,BufRead *.xmodal.erb set filetype=html.erb
