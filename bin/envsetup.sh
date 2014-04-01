#!/bin/sh
# Calvin.Lee<lihao921@gmail.com> @ Mon Sep  9 11:12:58 CST 2013

P_ROOT=~/github/calvinlee/linux-profile

sudo apt-get update

sudo apt-get remove vim-tiny
sudo apt-get install vim-gnome
sudo apt-get install git-core tig git-doc curl meld
sudo apt-get install gthumb \
ecryptfs-utils \
exuberant-ctags \
gconf-editor \
dconf-tools \
rar \
p7zip \
kolourpaint4 \
aria2 \
samba \
filezilla \
sqliteman \
gnome-tweak-tool \
alacarte \
python-pip \
terminator \
ia32-libs

# Remove overlay scrollbar
sudo apt-get remove overlay-scrollbar liboverlay-scrollbar
gsettings set org.gnome.desktop.interface ubuntu-overlay-scrollbars false

echo "====Setting up fonts.."
sudo cp -R ../fonts/Consolas /usr/share/fonts/
sudo cp -R ../fonts/SourceCodePro /usr/share/fonts/
sudo mkfontscale
sudo mkfontdir
sudo fc-cache -fv

echo "====Setting up ack grep util.."
curl http://beyondgrep.com/ack-2.08-single-file > $P_ROOT/bin/ack && chmod 0755 $P_ROOT/bin/ack

echo "====Setting user profiles.."
mv $HOME/.bashrc $HOME/.bashrc.bak
ln -s $P_ROOT/.bashrc $HOME/.bashrc

mv $HOME/.bash_aliases $HOME/.bash_aliases.bak
ln -s $P_ROOT/.bash_aliases $HOME/.bash_aliases

mv $HOME/.vimperatorrc $HOME/.vimperatorrc.bak
ln -s $P_ROOT/.vimperatorrc $HOME/.vimperatorrc

mv $HOME/.vim $HOME/.vim.bak
ln -s $P_ROOT/.vim $HOME/.vim

mv $HOME/.vimrc $HOME/.vimrc.bak
ln -s $P_ROOT/.vimrc $HOME/.vimrc

mv $HOME/.gvimrc $HOME/.gvimrc.bak
ln -s $P_ROOT/.gvimrc $HOME/.gvimrc

mv $HOME/.gitconfig $HOME/.gitconfig.bak
ln -s $P_ROOT/.gitconfig $HOME/.gitconfig

echo "====Setting up zsh"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
mv ~/.zshrc ~/.zshrc.bak
ln -s $P_ROOT/.zshrc $HOME/.zshrc
# chsh -s /bin/zsh
