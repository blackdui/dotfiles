# vim:foldmethod=marker
#!/bin/bash
set -e
#essential packages{{{1
sudo apt update
sudo apt install -y wget curl vim stow git ripgrep
sudo apt install -y apt-get install xserver-xorg-input-evdev xserver-xorg-input-kbd xserver-xorg-input-mouse xserver-xorg-video-intel
sudo apt install -y i3 kitty lightdm 
sudo apt install -y xcompmgr fcitx5 fcitx5-rime feh \
                network-manager-gnome volumeicon-alsa pulseaudio \
                pavucontrol xorg lxappearance rofi mate-power-manager
#}}}

#rime{{{1
sudo apt install -y fcitx5 fcitx5-rime
sudo apt install -y ttf-wqy-zenhei fonts-noto-color-emoji
echo "export XMODIFIERS=@im=fcitx" >> ~/.bashrc
echo "export GTK_IM_MODULE=fcitx" >> ~/.bashrc
echo "export QT_IM_MODULE=fcitx" >> ~/.bashrc
echo "export GLFW_IM_MODULE=ibus" >> ~/.bashrc
#}}}

#nerdfonts{{{1
#wget https://github.com/laishulu/Sarasa-Term-SC-Nerd/releases/download/v2.3.1/SarasaTermSCNerd-Unhinted.ttf.7z
#fc-cache -fv
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

