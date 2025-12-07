PROMPT='%{%F{white}%B%}%n%{%f%b%}@%{%F{blue}%B%}%m%{%f%b%} %1~ %# ' # 🌈 prompt customization
export XDG_CONFIG_HOME="$HOME/.config" # using the XDG standard to keep home directory clean
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git" # using zinit as a plugin manager
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh" # installing starship using zinit
zinit light starship/starship
zinit light zdharma-continuum/fast-syntax-highlighting # installing the fast syntax highlighting feature
zinit light zsh-users/zsh-autosuggestions # install the auto suggestions feature
eval "$(/opt/homebrew/bin/brew shellenv)" # required for 🍺 brew
alias python='python3' # default python to be used is python3 (ensure using brew python)
alias pip='pip3' # default pip to be used is pip3 (ensure using brew pip)
alias sfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app' # show all hidden files in finder
alias vim='nvim' # making neovim the default editor
alias hfiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app' # hide all hidden files in finder
alias zconf="vim ~/.zshrc" # easily edit the zshrc file
alias smhud="/bin/launchctl setenv MTL_HUD_ENABLED 1" # show the metalhud in games
alias hmhud="/bin/launchctl setenv MTL_HUD_ENABLED 0" # hide the metalhud in games
alias vclean="find . -name .DS_Store -delete" # resets the view settings for all the files and folders in the current directory
alias dstart="cd $HOME/Developer/" # shortcut to start development and go to the developer folder
alias aconf="vim /usr/local/etc/httpd/httpd.conf" # edit the default apache server running on macOS.
alias isync="~/Developer/Git/icloud_sync/icloud_sync.sh"
alias csync="if [ -d $HOME/.dotfiles ]; then ~/.dotfiles/config.sh; else echo \"not configured\"; fi" # setting up the configuration on the system
alias fhide="SetFile -a V" # makes a file hidden
function pages(){ osascript -e 'on run argv' -e 'set current_path to POSIX file ((POSIX path of item 1 of argv) & "/"&(item 2 of argv)&".pages") as string' -e 'tell application "Pages" to save (make new document) in file  current_path' -e 'end run' "$PWD" "$1";}; # apple script to open a pages file in the current path
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock # required for the 1p ssh agent
export EDITOR="nvim" # setting default edit to neovim
export IPYTHONDIR=$XDG_CONFIG_HOME/ipython
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH" # add java to path
export JAVA_HOME="/opt/homebrew/opt/openjdk" # add java home variable
export M2_REPO="$XDG_DATA_HOME/maven/repository" # changing mavens repo location
export MAVEN_OPTS="-Dmaven.repo.local=$M2_REPO" # ensure that plugins use the new repo location
export GOPATH="$XDG_DATA_HOME/.go" # add gopath variable
export GOCACHE="$XDG_CACHE_HOME/go-build"
export PATH="$GOPATH/bin:$PATH" # add go to path
export GOTOOLCHAIN=local
export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia"
export JULIA_CONFIG_DIR="$XDG_CONFIG_HOME/julia"
export JULIA_STATE_DIR="$XDG_STATE_HOME/julia"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export JUPYTERLAB_SETTINGS_DIR="$XDG_CONFIG_HOME/jupyter_lab"
export JUPYTERLAB_WORKSPACES_DIR="$XDG_CONFIG_HOME/jupyter_lab_workspaces"
export MPLCONFIGDIR="$XDG_CONFIG_HOME/matplotlib"
export MPLCACHEDIR="$XDG_CACHE_HOME/matplotlib"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH" # add postgres to the path
export PSQL_HISTORY="$XDG_STATE_HOME/psql_history"
export PYTHONHISTFILE="$XDG_STATE_HOME/python_history"
export PATH="$HOME/.cargo/bin:$PATH" # add programs installed through rust cargo
eval "$(starship init zsh)" # for 🚀 starship
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node_repl_history"
export NVM_DIR="$XDG_DATA_HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
bindkey -e # setting the EDITOR variable enables zsh viin mode in tmux
