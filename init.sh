# vim:foldmethod=marker
#!/bin/bash
set -e
#essential packages{{{1
sudo apt update
sudo apt install -y curl vim stow git ripgrep
sudo apt install -y i3 kitty lightdm 
sudo apt install ttf-wqy-zenhei fonts-noto-color-emoji
sudo apt install -y xcompmgr fcitx5 fcitx5-rime feh \
                network-manager-gnome volumeicon-alsa pulseaudio \
                pavucontrol xorg lxappearance rofi
#}}}
        
#stow emacs27 -t ~/.emacs.d
stow i3 -t ~/.config/i3
stow tmux3.2
stow kitty/ -t ~/.config/kitty/

#fzf{{{1
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
#}}}

#vim{{{2
stow vim8.2
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c "PlugInstall"
#}}}

