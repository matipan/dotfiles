ZSH_THEME="matipanv3"
COMPLETION_WAITING_DOTS="false"

plugins=(git brew colored-man-pages docker golang git-extras)

export ZSH=/Users/matipan/.oh-my-zsh
export PATH="/usr/local/sbin:$PATH"
export PATH=$HOME/Code/bin:/usr/local/bin:$PATH

source ~/.iterm2_shell_integration.zsh

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
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH=$PATH:/usr/local/Cellar/gcc/8.1.0/bin/
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-10.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH

alias gcc="gcc-8"
alias g++="g++-8"
alias cpp="cpp-8"
alias gcov="gcov-8"
alias gcov-tool="gcov-tool-8"
alias gcov-dump="gcov-dump-8"
alias gcc-ranlib="gcc-ranlib-8"
alias gcc-nm="gcc-nm-8"

alias lg='/bin/zsh --login'
alias sz='source ~/dotfiles/.zshrc'
alias nvimrc='nvim ~/dotfiles/.nvimrc'
alias nvimz='nvim ~/dotfiles/.zshrc'
alias o1='open .'
alias n='nvim'
alias trash='rmtrash' #del / trash are shorter than rmtrash
alias git=hub
alias go14="docker run -v $(pwd):/src/app -w /src/app golang:1.4 go"
alias go18="docker run -v $(pwd):/src/app -w /src/app golang:1.8 go"
alias dso="docker run -it matipan/debianso:latest"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export MY_IP="192.168.0.16"

# source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
# source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
