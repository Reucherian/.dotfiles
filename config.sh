if [ -d $HOME/.dotfiles ]; then
    cd $HOME/.dotfiles
    git pull
    stow zsh
    stow git
    stow starship
    stow tmux
    stow ghostty
    stow nvim
    stow kanata
    stow btop
    stow maven
    stow bat
else
    echo "$HOME/.dotfiles does not exist.\n clone to the home folder instead"
fi
