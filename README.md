# To Install

(Re)move ~/.vim and ~/.vimrc if you have them already, and run:

    git clone --recursive https://github.com/elliotf/vim-config.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc

# Updating

As long as your checkout is kept clean, you can easily update, rebase your local changes and update submodules with:

    cd ~/.vim && git pull --rebase ; git submodule update ; cd -