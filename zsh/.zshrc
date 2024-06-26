#======================================================================
# zsh - profile defaults
#======================================================================
# writtten by Reuben Cherian
# 💻 default shell preferences for my macOS terminal
#======================================================================
# 👾 architecture detection and switching
#======================================================================
# not maintaining a seperate install of brew for the x86_64 architecture
# to use this p10k prompt functioon make sure to add architecture in the p10k zsh prompt
function prompt_architecture() {
  arch_name="$(uname -m)" 
  if [ "${arch_name}" = "x86_64" ]; then
      if [ "$(sysctl -in sysctl.proc_translated)" = "1" ]; then
        p10k segment -b 7 -f 0 -t ' x86'
      else
        p10k segment -b 7 -f 0 -t ' x86'

      fi 
  elif [ "${arch_name}" = "arm64" ]; then

        p10k segment -b 7 -f 0 -i ' arm'
  else
    echo="?"
  fi
}

alias mzsh="arch -arm64 zsh"
alias izsh="arch -x86_64 zsh"
#======================================================================
# 🌈 prompt and theme related
#======================================================================
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
PROMPT='%{%F{white}%B%}%n%{%f%b%}@%{%F{blue}%B%}%m%{%f%b%} %1~ %# '
#======================================================================
# 🍺 brew configurations
#======================================================================
# The line below will help export the brew paths to the system
eval "$(/opt/homebrew/bin/brew shellenv)"
#======================================================================
# 🤖 dependencies required for installing tensorflow-macos
#======================================================================
export HDF5_DIR="/opt/homebrew/Cellar/hdf5/1.12.1_1/"
#======================================================================
# 📇 useful aliases
#======================================================================
alias python='python3' # default python to be used is python3
alias sfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app' # show all hidden files in finder
alias hfiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app' # hide all hidden files in finder
alias zconf="code ~/.zshrc" # easily edit the zshrc file
alias smhud="/bin/launchctl setenv MTL_HUD_ENABLED 1" # show the metalhud in games
alias hmhud="/bin/launchctl setenv MTL_HUD_ENABLED 0" # hide the metalhud in games
alias vclean="find . -name .DS_Store -delete" # resets the view settings for all the files and folders in the current directory
alias dstart="cd $HOME/Developer/" # shortcut to start development and go to the developer folder
alias aconf="code /usr/local/etc/httpd/httpd.conf" # edit the default apache server running on macOS.
alias lzd='lazydocker'
alias isync="~/Developer/Git/icloud_sync/icloud_sync.sh"
alias csync="if [ -d $HOME/.dotfiles ]; then ~/.dotfiles/config.sh; else echo \"not configured\"; fi" # setting up the configuration on the system
function pages(){ osascript -e 'on run argv' -e 'set current_path to POSIX file ((POSIX path of item 1 of argv) & "/"&(item 2 of argv)&".pages") as string' -e 'tell application "Pages" to save (make new document) in file  current_path' -e 'end run' "$PWD" "$1";}; # apple script to open a pages file in the current path
#======================================================================
# 🐍 tensorflow-metal support only through conda
#======================================================================
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#======================================================================
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export JAVA_HOME="/opt/homebrew/opt/openjdk@11"
#======================================================================
# node version manager
#======================================================================
# export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
#======================================================================
# 🚦 go config
#======================================================================
export GOPATH="$HOME/.go"
export PATH="$HOME/.go/bin:$PATH"
export GOROOT="/opt/homebrew/opt/go/libexec"
#======================================================================
# 🤖 x86 config
#======================================================================
alias ibrew='arch -x86_64 /usr/local/bin/brew'
#======================================================================
# 🐘 postgresql
#======================================================================
PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
# SetFile -a V file_name
#======================================================================
# 🚀 starship
#======================================================================
eval "$(starship init zsh)"
#======================================================================