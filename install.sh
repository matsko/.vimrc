git clone git@github.com:matsko/.vimrc.git ~/.vim
git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s ~/.vim/.vimrc ~/.vimrc
mvim +BundleInstall +qall
