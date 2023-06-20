#!/bin/zsh

if [ `which zsh` != "/usr/bin/zsh" ] ; then
  sudo apt install -y zsh
fi

ln -sv zshrc ~/.zshrc

# fzf
if [ `which fzf` != "/usr/bin/fzf" ] ; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

sh -c "$(curl -fsSL https://git.io/zinit-install)"
source ~/.zshrc
zinit self-update

# setings
if [ $SHELL != "/usr/bin/zsh" ] ; then
  chsh -s /usr/bin/zsh
fi

