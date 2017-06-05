# Path to your oh-my-zsh installation.
export ZSH=/Users/Matias/.oh-my-zsh

# Theme
ZSH_THEME="kriox26"

plugins=(git docker golang colored-man-pages git-extras)

# User configuration

export PATH=$PATH:"/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export MANPATH="/usr/local/man:$MANPATH"
export PATH="/usr/local/sbin:$PATH"
export PATH=~/Code/bin:$PATH
# export PATH=~/Code/go_appengine:$PATH
export ANDROID_HOME=~/Library/Android/sdk
export PATH=~/Library/Android/sdk/platform-tools:$PATH
export PATH=~/Library/Android/sdk/tools:$PATH
export GOROOT="/usr/local/opt/go/libexec"
export GOPATH=$HOME/Code/GoWorkspace
export PATH=~/Code/go_appengine:$PATH
export PATH=$PATH:$GOPATH/bin/
export PATH=$PATH:$GOROOT/bin
export GOGITHUB=$GOPATH/src/github.com/matipan/

export EDITOR="nvim"
export GIT_EDITOR="nvim"
source $ZSH/oh-my-zsh.sh

# tiny-care-terminal env variables
export TTC_BOTS='golang_cls,golangweekly,selfcare_bot'
# export TTC_REPOS=''
export TTC_WEATHER='La Plata'
export TTC_CELSIUS=true
export TTC_APIKEYS=true
export TTC_UPDATE_INTERVAL=20
export CONSUMER_KEY='WrnDRX1jzOND0PbMcl5UJ8Muw'
export CONSUMER_SECRET='as45QxZ9Y6NtT6UPdXmjECqTcgu6D2dWYcwyQYolwrVqfbg28p'
export ACCESS_TOKEN='3311202838-VBucy03RKyeiGVBBkDNu0Rr9nyVxt7TNtJoiXBw'
export ACCESS_TOKEN_SECRET='pPvT7L6iIJ2zW95swIxyAcKALGSr1sblhkO39VJ5ObTip'

alias emacs="/usr/local/Cellar/emacs/24.5/bin/emacs --no-window-system"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#Basic alias
	alias gtg='brew update && brew upgrade && brew cleanup'
  alias lg='/bin/zsh --login'
	alias vimbp='vim ~/.bash_profile' #For faster openning of .bash_profile
	alias sbp='source ~/.bash_profile' #For faster sourcing
	alias sz='source ~/Documents/dotfiles/.zshrc'
	alias vimrc='vim ~/.vimrc'	#convenient way for open .vimrc
	alias vimgc='vim ~/.gitconfig' #vimgc: open .gitconfig
	alias nvimrc='nvim ~/Documents/dotfiles/.nvimrc'
	alias nvimz='nvim ~/Documents/dotfiles/.zshrc'
	alias vimz='vim ~/.zshrc'
	alias c='clear' #I'm lazy, so what...
	alias e='exit'
	alias o='open'
	alias o1='open .'
	alias v='vim'
	alias n='nvim'
	alias ls='ls -G'  #Displays a list of dirs and files with colors
	alias la='ls -Ga' #Displays all hidden files and reg files with la
	alias lf='ls -GFlash' #Displays hidden and reg files with usefull info
	alias del='rmtrash'
	alias trash='rmtrash' #del / trash are shorter than rmtrash
	alias starwars='telnet towel.blinkenlights.nl'
	alias changelog='sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText'
	alias resetlog='sudo defaults delete /Library/Preferences/com.apple.loginwindow'
	alias msqlstart='sudo /usr/local/Cellar/mysql/5.6.25/support-files/mysql.server start'

  alias swagger-editor="docker run -p 6060:8080 swaggerapi/swagger-editor"
  alias swagger-ui="docker run -p 3030:8080 swaggerapi/swagger-ui"


#hub
	alias git=hub

# Load zsh-syntax-highlighting.
# source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Load zsh-autosuggestions.
# source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/autosuggestions.zsh
# Enable autosuggestions automatically.
# zle-line-init() {
    # zle autosuggest-start
# }
# zle -N zle-line-init

# test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
