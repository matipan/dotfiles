export PATH=$HOME/Code/bin:/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"
export ZSH=/Users/matipan/.oh-my-zsh
export ANDROID_TOOLS=/Users/matipan/Library/Android/sdk/platform-tools/
export ANDROID_TOOLS_BIN=/Users/matipan/Library/Android/sdk/tools/bin/
export ANDROID_SDK=/Users/matipan/Library/Android/sdk/tools/
export ANDROID_HOME=/Users/matipan/library/Android/sdk
export PATH=$PATH:$ANDROID_TOOLS
export PATH=$PATH:$ANDROID_SDK
export PATH=$PATH:$ANDROID_TOOLS_BIN

source ~/.iterm2_shell_integration.zsh

ZSH_THEME="kriox26"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(git brew colored-man-pages docker golang git-extras)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export SSH_KEY_PATH="~/.ssh/rsa_id"
export MANPATH="/usr/local/man:$MANPATH"
export GOROOT="/usr/local/opt/go/libexec"
export GOPATH=$HOME/Code/golang
export PATH=$PATH:$GOPATH/bin/
export PATH=$PATH:$GOROOT/bin
export GOGHUB=$GOPATH/src/github.com/matipan/
export GOGLAB=$GOPATH/src/gitlab.com/matipan/
export GIT_EDITOR="nvim"
export PATH=/Volumes/case-sensitive/esp-open-sdk/xtensa-lx106-elf/bin:$PATH
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$HOME/Code/couchbase-sync-gateway/bin:$PATH"

alias lg='/bin/zsh --login'
alias sz='source ~/dotfiles/.zshrc'
alias nvimrc='nvim ~/dotfiles/.nvimrc'
alias nvimz='nvim ~/dotfiles/.zshrc'
alias o1='open .'
alias n='nvim'
alias trash='rmtrash' #del / trash are shorter than rmtrash
alias git=hub
alias go18="docker run -v $(pwd):/src/app -w /src/app golang:1.8 go"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export MY_IP="192.168.0.16"

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
