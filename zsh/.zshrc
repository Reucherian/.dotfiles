PROMPT='%{%F{white}%B%}%n%{%f%b%}@%{%F{blue}%B%}%m%{%f%b%} %1~ %# ' # 🌈 prompt customization
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git" # using zinit as a plugin manager
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh" # installing starship using zinit
zinit light starship/starship
eval "$(/opt/homebrew/bin/brew shellenv)" # required for 🍺 brew
alias mzsh="arch -arm64 zsh" # change architecture of shell to arm
alias izsh="arch -x86_64 zsh" # change architecture of shell to x86
alias ibrew='arch -x86_64 /usr/local/bin/brew'
alias python='python3' # default python to be used is python3
alias sfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app' # show all hidden files in finder
alias vim='nvim' # making neovim the default editor
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
alias fhide="SetFile -a V" # makes a file hidden
function pages(){ osascript -e 'on run argv' -e 'set current_path to POSIX file ((POSIX path of item 1 of argv) & "/"&(item 2 of argv)&".pages") as string' -e 'tell application "Pages" to save (make new document) in file  current_path' -e 'end run' "$PWD" "$1";}; # apple script to open a pages file in the current path
function prompt_architecture() { arch_name="$(uname -m)"; if [ "${arch_name}" = "x86_64" ]; then if [ "$(sysctl -in sysctl.proc_translated)" = "1" ]; then echo 'x86'; else echo 'x86'; fi; elif [ "${arch_name}" = "arm64" ]; then echo 'arm'; else echo="?"; fi } # shell function to prompt if rosetta is being used or not
export HDF5_DIR="/opt/homebrew/Cellar/hdf5/1.12.1_1/" # required for tensorflow-macos
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH" # add java to path
export JAVA_HOME="/opt/homebrew/opt/openjdk@11" # add java home variable
export GOPATH="$HOME/.go" # add gopath variable
export PATH="$HOME/.go/bin:$PATH" # add go to path
export GOTOOLCHAIN=local
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH" # add postgres to the path
export PATH="$HOME/.cargo/bin:$PATH" # add programs installed through rust cargo
eval "$(starship init zsh)" # for 🚀 starship
