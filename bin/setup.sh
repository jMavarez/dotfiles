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

# TODO:
# Git breeze
git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh
source ~/.bashrc
echo "Git breeze ✔"

# Zsh
brew install zsh
chsh -s /bin/zsh
echo "Zsh ✔"

# The Silver Searcher
brew install the_silver_searcher
# If Ubuntu / Debian -> apt-get install silversearcher-ag
echo "The Silver Searcher ✔"

# Thefuck
brew install thefuck
echo "Thefuck ✔"

# Setup NVM (?)

# Setup default project folder
PROJECT_FOLDER="$HOME/Desktop/projects"
mkdir -p $PROJECT_FOLDER
echo "Dev workspaces ✔"

# Setup personal github projects
BASE_GITHUB="https://github.com/jMavarez"
PROJECTS=(
  "Tana",
  "best-resume-ever"
)

for PROJECT in ${PROJECTS[@]}; do
   DIRNAME="$(basename $PROJECT)"
   git clone "$BASE_GITHUB/$PROJECT.git" $PROJECT_FOLDER/$DIRNAME
done
echo "Projects ✔"

# Setup Android Studio stuff

# Setup bash_profile
# echo "bash_profile ✔"

echo "(╯°□°）╯︵ ┻━┻) SETUP DONE!"
