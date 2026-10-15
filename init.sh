# vim:foldmethod=marker
#!/bin/bash
set -e
#essential 1.packages{{{1
packages() {
        sudo apt update
        sudo apt install -y wget curl stow git ripgrep 7zip font-config firefox-esr
}
#}}}

#2.rime{{{1
rime() {
        sudo apt install -y fcitx5 fcitx5-rime
        sudo apt install -y ttf-wqy-zenhei fonts-noto-color-emoji
}
#}}}

#3.zsh{{{1
zsh() {
        sudo apt install -y zsh
        chsh -s /bin/zsh
        stow zsh
        echo "export XMODIFIERS=@im=fcitx" >> ~/.zshrc
        echo "export GTK_IM_MODULE=fcitx" >> ~/.zshrc
        echo "export QT_IM_MODULE=fcitx" >> ~/.zshrc
        echo "export GLFW_IM_MODULE=ibus" >> ~/.zshrc
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

        sh -c "$(curl -fsSL https://install.ohmyz.sh/)"
}
#}}}

#4.i3wm {{{1
i3wm() {
        stow i3 -t ~/.config/i3
        sudo apt install -y apt-get install xserver-xorg-input-evdev xserver-xorg-input-kbd xserver-xorg-input-mouse xserver-xorg-video-intel
        sudo apt install -y i3 sddm
        sudo apt install -y xcompmgr feh \
                network-manager-gnome volumeicon-alsa pulseaudio \
                pavucontrol xorg lxappearance rofi mate-power-manager
        }
#}}}1

#5.fzf{{{1
fzf() {
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install
}
#}}}

#6.vim{{{1
vim() {
        sudo apt install -y vim
        stow vim8.2
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        vim -c "PlugInstall"
}
#}}}1

#7.nerdfonts{{{1
nerdfonts() {
        wget -P ~ https://github.com/laishulu/Sarasa-Term-SC-Nerd/releases/download/v2.3.1/SarasaTermSCNerd-Unhinted.ttf.7z
        mkdir -p ~/.local/share/fonts
        7z x ~/SarasaTermSCNerd-Unhinted.ttf.7z -o~/.local/share/fonts
        fc-cache -fv
}
#}}}

#8.kitty{{{1
kitty() {
        sudo apt install -y kitty
        stow kitty/ -t ~/.config/kitty/
}
#}}}1

#9.tmux{{{1
tmux() {
        sudo apt install -y tmux
        stow tmux3.2
}
#}}}1

#stow emacs27 -t ~/.emacs.d

packages()
i3wm()
kitty()
tmux()
fzf()
nerdfonts()
vim()
zsh()
