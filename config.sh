if [ -d $HOME/.dotfiles ]; then
    cd $HOME/.dotfiles
    git pull
    stow zsh
    stow starship
    stow tmux
    stow ghostty
    stow nvim
    stow kanata
else
    echo "$HOME/.dotfiles does not exist.\n clone to the home folder instead"
fi
