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
        sh -c "$(curl -fsSL https://install.ohmyz.sh/)"
}
#}}}

#4.i3wm {{{1
i3wm() {
        sudo apt install -y apt-get install xserver-xorg-input-evdev xserver-xorg-input-kbd xserver-xorg-input-mouse xserver-xorg-video-intel
        sudo apt install -y i3 sddm
        sudo apt install -y xcompmgr feh pcmanfm\
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
}
#}}}1

#9.tmux{{{1
tmux() {
        sudo apt install -y tmux
        stow tmux3.2
}
#}}}1

#10.zshplugins{{{1
zshplugins() {
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

#}}}1


main() {
        packages()
        stow config -t ~/.config
        i3wm()
        kitty()
        tmux()
        nerdfonts()
        zsh()
        # zshplugins()
        # fzf()
        # vim()
        #stow emacs27 -t ~/.emacs.d
}

main "$@"
