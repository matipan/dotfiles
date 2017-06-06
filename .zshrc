export PATH=$HOME/Code/bin:/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"
export ZSH=/Users/matipan/.oh-my-zsh

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

alias lg='/bin/zsh --login'
alias sz='source ~/dotfiles/.zshrc'
alias nvimrc='nvim ~/dotfiles/.nvimrc'
alias nvimz='nvim ~/dotfiles/.zshrc'
alias o1='open .'
alias n='nvim'
alias trash='rmtrash' #del / trash are shorter than rmtrash
alias git=hub

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
