# .dotfiles

## description

using stow to manage all the configuration files/dotfiles on a new system.

## install

make sure to clone the repo to the your $HOME directory and use the stow commands as below to setup the configuration on your new system.

```bash
git clone https://github.com/Reucherian/.dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles
stow zsh
stow starship
```
