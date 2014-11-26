" config "
set shell=/bin/zsh\ -i

" vundle stuff "
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" Plugin 'airblade/vim-gitgutter' "
Plugin 'bling/vim-airline'
Plugin 'mattn/emmet-vim'

" Seldom Used "
Plugin 'terryma/vim-multiple-cursors'
Plugin 'xolox/vim-session'

" Deps "
Plugin 'tpope/vim-eunuch'
Plugin 'mattn/webapi-vim'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'xolox/vim-misc'

" Dart "
Plugin 'dart-lang/dart-vim-plugin'

" HTML "
Plugin 'othree/html5.vim'

" Clojure "
Plugin 'guns/vim-clojure-static' 
Plugin 'tpope/vim-fireplace' 
Plugin 'tpope/vim-classpath' 

 " Tools "
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'embear/vim-localvimrc'
Plugin 'kien/ctrlp.vim'
Plugin 'danro/rename.vim'
Plugin 'epmatsw/ag.vim'
Plugin 'godlygeek/tabular'

" themes "
 Plugin 'yearofmoo/Vim-Darkmate' 
 Plugin 'chriskempson/vim-tomorrow-theme' 
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
map <Leader>snip :e ~/.emmet_snippets.json<Enter>
map <Leader>windows :ba<Enter>
map <Leader>spell :e ~/.vim/spell/en.utf-8.add<Enter>
map <Leader>l :setlocal number!<CR>
map <Leader>o :set paste!<CR>

" full screen
map <Leader>full :set invfu<CR>

" displays the hep information for syntax highlighting
map <Leader>hi :help highlight-groups<Enter>

" file searching with CTRLP
map <Leader>fuf :CtrlPClearCache<Enter>

" D-Keys "
map <D-i> @q
map <D-r> :CtrlP<Enter>
map <D-d> :CtrlPBuffer<Enter>

" Buffers "
map <D-k> :bnext<CR>
map <D-j> :bprev<CR>
map <D-b> :bprev<CR>

" Emmet Stuff "
map <D-u> <S-a><C-y>,
imap <D-u> <Esc><S-a><C-y>,

let g:multi_cursor_prev_key='<C-m>'
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.emmet_snippets.json')), "\n"))
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components\|tmp\|build'
let g:localvimrc_ask = 0
let g:session_autoload='no'

" this hops between your previous buffers "
map <Leader>bb :e ./joasjdoajsdoajsdoja<CR>:bd<CR>

" file searching and buffers "
nmap <S-up> <C-w><Up>
nmap <S-down> <C-w><Down>
nmap <S-left> <C-w><Left>
nmap <S-right> <C-w><Right>

" change j,k,A,I,^ and $ to always match wrapped lines "
nmap j gj
nmap k gk
nmap A g$a
nmap I g^i

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
au BufNewFile,BufRead *.bs-js set filetype=javascript
au BufNewFile,BufRead *.markdown set filetype=html
au BufNewFile,BufRead *.markdown.erb set filetype=html.erb
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.clj set syn=clojure
au BufNewFile,BufRead *.dart set syn=dart

" Formatting "
vmap \x :%!tidy -q -i --show-errors 0<CR>

setlocal spell spelllang=en
set spell spelllang=en
set spellfile=~/.vim/spell/en.utf-8.add

" airline
set laststatus=2

" Git fugitive stuff"
map <leader>gs :Gstatus<CR>
map <leader>gd :Gdiff<CR>
map <leader>gc :Gcommit<CR>
map <leader>gb :Gblame<CR>
map <leader>gl :Glog<CR>
map <leader>gp :Git push<CR>
map <leader>gwip :Git add .; git commit -m "wip"<CR>
map <leader>grm :Git fetch; git rebase master<CR>

" Tabbing "
map <Leader>a= :Tabularize /=<CR>
map <Leader>a<Space> :Tabularize /<Space><CR>
map <Leader>a: :Tabularize /:<CR>
map <Leader>a:: :Tabularize /:\zs<CR>
map <Leader>a, :Tabularize /,<CR>
map <Leader>a<Bar> :Tabularize /<Bar><CR>

if has("autocmd")
  let pandoc_html = "pandoc --from=html --to=markdown | pandoc --from=markdown --to=html"
  autocmd FileType html let &formatprg=pandoc_html
endif

nnoremap <Leader>j :%!python -m json.tool<CR>
nnoremap <Leader>h :'[,']call HtmlEscape()<CR>
vnoremap <Leader>h :call HtmlEscape()<CR>

function HtmlEscape()
  silent s/&/\&amp;/eg
  silent s/</\&lt;/eg
  silent s/>/\&gt;/eg
  silent s/"/\&quot;/eg
endfunction
