#!/usr/bin/env bash

#Vim stuff

BASE_DIR="$HOME/.vim"
PLUGIN_DIR="$BASE_DIR/bundle"
COLORS_DIR="$BASE_DIR/colors"
AUTOLOAD_DIR="$BASE_DIR/autoload"
PLUGINS=(
  "tpope/vim-pathogen"
  "kien/ctrlp.vim"
  "vim-airline/vim-airline"
  "vim-airline/vim-airline-themes"
  "scrooloose/nerdtree"
  "terryma/vim-multiple-cursors"
  "airblade/vim-gitgutter"
  "neoclide/vim-jsx-improve"
  "bigfish/vim-js-context-coloring"
  "leafgarland/typescript-vim"
  "posva/vim-vue"
  "justinmk/vim-syntax-extra"
  "udalov/kotlin-vim"
)

mkdir -p $PLUGIN_DIR
mkdir -p $COLORS_DIR
mkdir -p $AUTOLOAD_DIR

wget https://raw.githubusercontent.com/jMavarez/dotfiles/master/.vimrc -O $HOME/.vimrc
wget https://raw.githubusercontent.com/vim-scripts/Gummybears/master/colors/gummybears.vim -O $COLORS_DIR/gummybears.vim 

for PLUGIN in ${PLUGINS[@]}; do
   DIRNAME="$(basename $PLUGIN)"
   git clone https://github.com/$PLUGIN.git $PLUGIN_DIR/$DIRNAME
done

cp $PLUGIN_DIR/vim-pathogen/autoload/pathogen.vim $AUTOLOAD_DIR/pathogen.vim

echo "vim ✔"

#TODO:
#Setup NVM
#Setup Tana ('till binaries are released')
#Setup default project folder
#Setup personal github projects
#Setup Android Studio
#Setup bash_profile
#Setup Zsh

echo "(╯°□°）╯︵ ┻━┻) SETUP DONE!"
