#!/bin/bash

echo Setting vim config files now...

if [ "ls -A ~/.vim" ] && [ -f ~/.vimrc ]; then
    echo Back up your old vim config files now...
    mv ~/.vim ~/.vim.bck
    mv ~/.vimrc ~/.vimrc.bck
fi

cp -r ./vim ~/.vim
cp ./vimrc ~/.vimrc

echo Done!
