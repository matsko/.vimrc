"set the terminal to use z-shell
"(use -l since the interactive mode always fails)
set shell=/bin/zsh\ -l

" this needs to be temporarily disabled until vundle has done its thing
filetype off

" make sure there is no delay with the escape key
set timeoutlen=1000 ttimeoutlen=0

" vundle stuff "
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle manages all the packages for Vim:
" http://github.com/gmarik/Vundle.vim
Plugin 'gmarik/Vundle.vim'

" This plugin hooks into the git for the closest repo found within the project
" and sets up a side bar to let you know what areas of the file have changed.
" It may be a bit slow so it's disabled by default, however, it can be enabled
" on a per-project basis by using localvimrc. This link contains more  info:
" https://github.com/airblade/vim-gitgutter
Plugin 'airblade/vim-gitgutter'

" This plugin sets up a nice, colourful statusbar at the bottom of the vim
" session which lets the user know what mode they are in and what the current
" selection and status of the text position is. The link below has more info:
" http://github.com/bling/vim-airline. Remember to set the following
" configuration such that it is enabled by default: set laststatus=2
Plugin 'bling/vim-airline'

" Deps "
Plugin 'tpope/vim-eunuch'
Plugin 'mattn/webapi-vim'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'xolox/vim-misc'

" Dart "
Plugin 'dart-lang/dart-vim-plugin'

" Provides syntax-highlighting support for HTML5 markup in Vim.
" Click here to find out more: https://github.com/othree/html5.vim
Plugin 'othree/html5.vim'

" Clojure "
Plugin 'guns/vim-clojure-static' 
Plugin 'tpope/vim-fireplace' 
Plugin 'tpope/vim-classpath' 

 " Tools "
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'

" This plugins aims to make the cursor in terminal vim behave like it does in
" gui vim (by showing a skinny line when in insert and a block otherwise) "
Plugin 'jszakmeister/vim-togglecursor'

" Provides buffer and file searching capabilities directly in Vim.
" The commands set up in this configuration are:
" - ctrl-p (files)
" - ctrl-d (buffers)
"
" Use the up and down arrows to highlight a file to pick and enter to
" open it. You can also refresh the file list by typing <leader>fuf.
" Or you can type in :CtrlPClearCache<Enter>
"
" Click here to find out more: https://github.com/kien/ctrlp.vim
Plugin 'kien/ctrlp.vim'

" .editorconfig is a file that is used across a series of code editors that
" configures itself such that spacing, tabbing and token management is as
" similar as possible. With this plugin enabled, Vim will automatically
" configure itself to match the configurations present in the .editorconfig
" file (this will only be present for the directory that contains the config).
" More Info can be found here: https://github.com/editorconfig/editorconfig-vim
Plugin 'editorconfig/editorconfig-vim'

" This plugin allows a project-specific .vimrc file to be loaded in when Vim
" is active within that directory. The filename itself must be called
" .lvimrc and Vim itself may prompt you to ask if you want to load it in.
" The prompt can be configured using 'let g:localvimrc_ask = 0'. Click here
" to find out more about this plugin: https://github.com/embear/vim-localvimrc
Plugin 'embear/vim-localvimrc'

" This plugin fills the missing feature in vim to rename a file and still keep
" the same buffer around. Use :Rename NEW_NAME to rename the existing file
" (for this to work the file itself must already be created on the
" filesystem). Click here to read more: https://github.com/danro/rename.vim
Plugin 'danro/rename.vim'

" Excellent plugin for searching text occurances of text within a directory
" using the linux `ag` command. By typing in `:Ag 'search str' ./` then Ag
" will search the existing directory for 'search str' and then display the
" list of items inside of a buffer. The link below includes more information
" on the plugin: http://github.com/epmatsw/ag.vim. This video shows how to use
" Ag with :args and :argdo to search and replace file contents within a series
" of files within a project: https://www.youtube.com/watch?v=XzN4h4dj4cE 
Plugin 'epmatsw/ag.vim'

" A space-alignment tool that will evenly align the spacing between tokens
" such as :, |, ;, \ and = (you can set your own tokens as shortcuts. The
" shortcuts are typically things like <leader>a: which will align the spacing
" between and around all instances of a colon. To create you own shortcut,
" just call :Tabularize /* (where * is the token). The link below has more
" info on the plugin: https://github.com/godlygeek/tabular. (This was
" originally discovered from this Github vimrc repo: https://github.com/spf13/spf13-vim 
Plugin 'godlygeek/tabular'

" themes "
Plugin 'tpope/vim-vividchalk' 
Plugin 'tomasr/molokai' 

" Another really nice and colourful theme. There are multiple variations of
" this theme in terms of darkness. Click here to find out more about this
" theme: https://github.com/chriskempson/vim-tomorrow-theme
Plugin 'chriskempson/vim-tomorrow-theme' 

" A dark and colourful theme created by yearofmoo which was inspired from the
" theme present in the Gedit text editor. This theme works nicely with Ruby
" and JavaScript. Click here to find out more: https://github.com/yearofmoo/Vim-Darkmate
Plugin 'yearofmoo/Vim-Darkmate' 

" A nice gray and black theme with subdle gray and green colors
" works nicely with JS, HTML, CSS and Vim: https://github.com/ajh17/Spacegray.vim
Plugin 'ajh17/Spacegray.vim'

" This plugin is a visual undo viewer to see what changes have
" been made to a file: https://www.youtube.com/watch?v=vP4gEOUz4WM
Plugin 'sjl/gundo.vim'

" A Plugin to manage snippets located under ~/.vim/snippets
" Bundle garbas/vim-snipmate

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" This plugin allows for blocks of code to be wrapped in characters "
" tags and more: https://github.com/tpope/vim-surround "
Bundle "tpope/vim-surround"

" This plugin allows a scratch buffer to exist which can be used to write
" down notes without effecting other bueffers: https://github.com/mtth/scratch.vim
" use :Scratch or gs to open up the scratch buffer
Bundle "mtth/scratch.vim"

call vundle#end()

" highlight the code
syntax enable
filetype plugin indent on
set cursorline
set backspace=2 " make backspace work like most other apps

" theme
colorscheme spacegray

" Add a different color for the cursor line
" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
hi CursorLine guibg=#000000 ctermbg=0 gui=none
hi SignColumn guibg=#333333 ctermbg=235

" font
set guifont=Droid\ Sans\ Mono:h18

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
set hidden
set softtabstop=2
set wildmenu
set wildmode=list:longest
set incsearch
set ignorecase
set smartcase
set showmode
set tabstop=2
set shiftwidth=2
set expandtab

" Clear highlights "
nmap <Space> :nohl<Enter>

" external stuff
noremap <Leader>rvim :source $MYVIMRC<CR>
noremap <Leader>vim :e ~/.vimrc<Enter>
noremap <Leader>lvim :e .lvimrc<Enter>
noremap <Leader>tmuxrc :e ~/.tmux.conf<Enter>
noremap <Leader>tmuxsh :e ./.tmux.sh<Enter>
noremap <Leader>aliases :e ~/.zsh/.aliases<Enter>
noremap <Leader>spell :e ~/.vim/spell/en.utf-8.add<Enter>
noremap <Leader>l :setlocal number!<CR>

" full screen
map <Leader>full :set invfu<CR>

" displays the hep information for syntax highlighting
map <Leader>hi :help highlight-groups<Enter>

" file searching with CTRLP
noremap <Leader>fuf :CtrlPClearCache<Enter>
noremap <leader>. :CtrlPTag<cr>

" D-Keys "
noremap <c-o> @@
inoremap <c-o> <Esc>@@
noremap <c-d> :CtrlPBuffer<Enter>
inoremap <c-d> <Esc>:CtrlPBuffer<Enter>
noremap <c-r> :redo<Enter>

" Use this if you want all buffers to become tabs
"au BufAdd,BufNewFile * nested tab sball"

" Snippets "
map <Leader>snip :e ~/.vim/UltiSnips<Enter>
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
inoremap <c-x><c-k> <c-x><c-k>
let g:UltiSnipsEditSplit="vertical"

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components\|tmp\|build'
let g:localvimrc_ask = 0

" netrw is the annoying default vim file browser. This is disabled here such
" that the <s-down><s-up> keyboard commands can be used to traverse buffers
let loaded_netrwPlugin = 1

" gitgutter is great but it's slow, so I only want it to be enabled on
" projects that I choose. What goes on here is that it is disabled at start,
" but if it is enabled manually (via :GitGutterEnable) or enabled directly
" inside of a localvimrc file then it will be on for that specific project.
let g:gitgutter_enabled = -1

" Number Incrementation "
set nf=octal,hex,alpha
noremap <silent> <Leader>[ <C-X>
inoremap <silent> <Leader>[ <Esc><C-X>a
vnoremap <silent> <Leader>[ <Esc><C-X>v
noremap <silent> <Leader>] <C-A>
inoremap <silent> <Leader>] <Esc><C-A>a
vnoremap <silent> <Leader>] <Esc><C-A>v

" file searching and buffers "
noremap <c-k> <C-w><Up>
noremap <c-j> <C-w><Down>
noremap <c-h> <C-w><Left>
noremap <c-l> <C-w><Right>
noremap <C-Space> <C-w>o
noremap <C-@> <C-w>o
noremap <C-g> ddp
noremap <C-t> ddkP
noremap <C-f> o<Esc>j

" Buffers "
nnoremap <c-a> ggVG<CR>
inoremap <c-a> <Esc>ggVG<CR>
vnoremap <c-a> ggG<CR>
noremap <c-u> :b#<CR>
noremap K kJ

" change j,k,A,I,^ and $ to always match wrapped lines "
nmap j gj
nmap k gk
nmap A g$a
nmap I g^i

" indentation "
vmap < <gv
vmap > >gv

nnoremap <c-s> <Esc>:z

" trim "
vmap tt :s/\s\+$//<CR><Esc><Space>
nmap tt Vtt

" theme inspection "
nmap <Leader>t :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc 

" File Type Highlighting
au BufNewFile,BufRead *.markdown set filetype=html
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.clj set syn=clojure
au BufNewFile,BufRead *.dart set syn=dart
au BufNewFile,BufRead *.lvimrc set syn=vim
au BufNewFile,BufRead *.es6.js set syn=javascript
au BufNewFile,BufRead *.es6 set syn=javascript
au BufNewFile,BufRead *.es6.ts set syn=javascript
au BufNewFile,BufRead *.ts set syn=javascript
au BufNewFile,BufRead * set nopaste

set pastetoggle=<leader>p

"setlocal spell spelllang=en
"set spell spelllang=en
"set spellfile=~/.nvim/spell/en.utf-8.add

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

" Tabbing / Code Alignment / Formatters "
map <Leader>a=        :Tabularize /=<CR>
map <Leader>a<Space>  :Tabularize /<Space><CR>
map <Leader>a:        :Tabularize /:<CR>
map <Leader>a::       :Tabularize /:\zs<CR>
map <Leader>a,        :Tabularize /,<CR>
map <Leader>a;        :Tabularize /;<CR>
map <Leader>a<Bar>    :Tabularize /<Bar><CR>
map <Leader>a[        :Tabularize /[<CR>
map <Leader>a]        :Tabularize /]<CR>
vmap <Leader>at   :!~/.vim/scripts/align-html-attributes.js<CR>
nmap <Leader>at  V:!~/.vim/scripts/align-html-attributes.js<CR>
vmap <Leader>aa   :!~/.vim/scripts/javascript-array.js<CR>
nmap <Leader>aa  V:!~/.vim/scripts/javascript-array.js<CR>
vmap <Leader>ab   :!~/.vim/scripts/boolean-attrs.js<CR>
nmap <Leader>ab  V:!~/.vim/scripts/boolean-attrs.js<CR>
vmap <Leader>ac   :!~/.vim/scripts/semicolon-values.js<CR>
nmap <Leader>ac  V:!~/.vim/scripts/semicolon-values.js<CR>
vmap <Leader>al   :!~/.vim/scripts/log-variable.js<CR>
nmap <Leader>al  V:!~/.vim/scripts/log-variable.js<CR>

" Angular-specific "
vmap <Leader>nga  :!~/.vim/scripts/angular-di-annotate.js<CR>
nmap <Leader>nga V:!~/.vim/scripts/angular-di-annotate.js<CR>
command AngularInstall execute "!~/.vim/scripts/angular-install.sh"

let g:html_indent_inctags = "body,tbody"

nmap <Leader>j :%!python -m json.tool<CR>
nmap <Leader>h :'[,']call HtmlEscape()<CR>
vmap <Leader>h :call HtmlEscape()<CR>
nmap <leader>u :GundoToggle<CR>

function HtmlEscape()
  silent s/&/\&amp;/eg
  silent s/</\&lt;/eg
  silent s/>/\&gt;/eg
  silent s/"/\&quot;/eg
endfunction

map <Leader>drr  :Range<space>
map <Leader>dr10 :Range<space>1,10<CR>
map <Leader>dr99 :Range<space>1,99<CR>
command! -nargs=+ Range put =range(<args>)|cw

map <Leader>fchx :!chmod +x %<CR>

" scripts"
map <Leader>scripts :e ~/.vim/scripts<Enter>
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

" Make sure that copy and paste uses the clipboard register
vmap <C-c> "+y
imap <C-c> <Esc><Leader>p<Esc>"+y

" For terminal vim + iterm2 we need to explicitly configure the cursor "
" for both insert mode as well as other modes "
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

nmap <Leader>iit ^j?iit(<CR>xw/it(<CR>ii<ESC>:w<CR>
nmap <Leader>reg :registers abcdefghi<CR>
vmap <Leader>reg <Esc>:registers abcdefghi<CR>

vnoremap <Leader>1 "ay<Esc>
vnoremap <Leader>2 "by<Esc>
vnoremap <Leader>3 "cy<Esc>
vnoremap <Leader>4 "dy<Esc>
vnoremap <Leader>5 "ey<Esc>
vnoremap <Leader>6 "fy<Esc>
vnoremap <Leader>7 "gy<Esc>
vnoremap <Leader>8 "hy<Esc>
vnoremap <Leader>9 "iy<Esc>

nnoremap <Leader>1 "ap
nnoremap <Leader>2 "bp
nnoremap <Leader>3 "cp
nnoremap <Leader>4 "dp
nnoremap <Leader>5 "ep
nnoremap <Leader>6 "fp
nnoremap <Leader>7 "gp
nnoremap <Leader>8 "hp
nnoremap <Leader>9 "ip
