set shell=/bin/zsh\ -i

" vundle stuff "
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'

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
Plugin 'ajh17/Spacegray.vim'

" This plugin is a visual undo viewer to see what changes have "
" been made to a file: https://www.youtube.com/watch?v=vP4gEOUz4WM "
Plugin 'sjl/gundo.vim'

" A Plugin to manage snippets located under ~/.vim/snippets "
Bundle "garbas/vim-snipmate"

" This plugin allows for blocks of code to be wrapped in characters "
" tags and more: https://github.com/tpope/vim-surround "
Bundle "tpope/vim-surround"

" This plugin allows a scratch buffer to exist which can be used to write "
" down notes without effecting other bueffers: https://github.com/mtth/scratch.vim "
" use :Scratch or gs to open up the scratch buffer "
Bundle "mtth/scratch.vim"

call vundle#end()

" highlight the code
syntax enable
filetype plugin indent on
set cursorline

" theme
colorscheme spacegray

" Add a different color for the cursor line
hi CursorLine guibg=#000000 ctermbg=0 gui=none

" font
set guifont=Droid\ Sans\ Mono:h22

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
map <Leader>l :setlocal number!<CR>
map <Leader>o :set paste!<CR>

" full screen
map <Leader>full :set invfu<CR>

" displays the hep information for syntax highlighting
map <Leader>hi :help highlight-groups<Enter>

" file searching with CTRLP
map <Leader>fuf :CtrlPClearCache<Enter>

" D-Keys "
map <D-i> @@
map <D-r> :CtrlP<Enter>
map <D-d> :CtrlPBuffer<Enter>

" Buffers "
map <S-x> :bd<CR>
map <D-k> :bnext<CR>
map <D-j> :bprev<CR>

"au BufAdd,BufNewFile * nested tab sball"

" Useful mappings for managing tabs
map <D-0> :tablast
map <D-[> :tabprevious
map <D-]> :tabnext
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt

" Snippets "
map <D-u> a<Plug>snipMateNextOrTrigger
imap <D-u> <Plug>snipMateNextOrTrigger
map <Leader>snip :e ~/.vim/snippets<Enter>

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['javascript'] = 'js,javascript'

let g:multi_cursor_prev_key='<C-m>'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components\|tmp\|build'
let g:localvimrc_ask = 0
let g:session_autoload='no'

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

nnoremap ; :
vnoremap ; :

" indentation "
vmap < <gv
vmap > >gv

" trim "
vmap tt :s/\s\+$//<CR><Esc><Space>
nmap tt Vtt

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
map <leader>gs   :Gstatus<CR>
map <leader>gd   :Gdiff<CR>
map <leader>gc   :Gcommit<CR>
map <leader>gb   :Gblame<CR>
map <leader>gl   :Glog<CR>
map <leader>gp   :Git push<CR>
map <leader>gwip :Git add .; git commit -m "wip"<CR>
map <leader>grm  :Git fetch; git rebase master<CR>

" Tabbing "
map <Leader>a=        :Tabularize /=<CR>
map <Leader>a<Space>  :Tabularize /<Space><CR>
map <Leader>a:        :Tabularize /:<CR>
map <Leader>a::       :Tabularize /:\zs<CR>
map <Leader>a,        :Tabularize /,<CR>
map <Leader>a;        :Tabularize /;<CR>
map <Leader>a<Bar>    :Tabularize /<Bar><CR>
map <Leader>a[        :Tabularize /[<CR>
map <Leader>a]        :Tabularize /]<CR>
vmap <Leader>at :!~/.vim/scripts/align-html-attributes.js<CR>
nmap <Leader>at V:!~/.vim/scripts/align-html-attributes.js<CR>

if has("autocmd")
  let pandoc_html = "pandoc --from=html --to=markdown | pandoc --from=markdown --to=html"
  autocmd FileType html let &formatprg=pandoc_html
endif

nmap <Leader>j :%!python -m json.tool<CR>
nmap <Leader>h :'[,']call HtmlEscape()<CR>
vmap <Leader>h :call HtmlEscape()<CR>

function HtmlEscape()
  silent s/&/\&amp;/eg
  silent s/</\&lt;/eg
  silent s/>/\&gt;/eg
  silent s/"/\&quot;/eg
endfunction

map <Leader>rr :Range<space>
map <Leader>r10 :Range<space>1,10<CR>
map <Leader>r99 :Range<space>1,99<CR>
command! -nargs=+ Range put =range(<args>)|cw


" scripts"
map <Leader>scripts :e ~/.vim/scripts<Enter>
command AngularInstall execute "!~/.vim/scripts/angular-install.sh"
command GulpInstall execute "!~/.vim/scripts/gulp-install.sh"

" Real Data Collection "
map <Leader>dm :DataMonths<space>
command -nargs=+ DataMonths execute "$read !~/.vim/scripts/months.js <args>"

" Fake Data Collection "
map <Leader>dfake :FakeData 10<space>
map <Leader>dfn   :FakeData 10 name<CR>
map <Leader>dffn  :FakeData 10 first_name<CR>
map <Leader>dfln  :FakeData 10 last_name<CR>
map <Leader>dfe   :FakeData 10 email<CR>
map <Leader>dfu   :FakeData 10 url<CR>
map <Leader>dfip  :FakeData 10 ip<CR>
map <Leader>dfct  :FakeData 10 city<CR>
map <Leader>dfcl  :FakeData 10 color<CR>
command -nargs=+ FakeData execute "$read !~/.vim/scripts/fake_data.rb <args>"

" Send Visually selected area to gist "
vnoremap <leader>gist :w !gist -p -t %:e \| pbcopy<cr>
vnoremap <leader>pubgist :w !gist -t %:e \| pbcopy<cr>

vnoremap <leader>haste :call HasteUpload()<CR>
function HasteUpload() range
  echo system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\n")).'| haste | xsel -ib')
endfunction
