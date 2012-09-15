git clone git@github.com:matsko/.vim.git ~/.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s ~/.vim/.vimrc ~/.vimrc
mvim +BundleInstall +qall
