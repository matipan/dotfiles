export ZSH="/home/capitan/.oh-my-zsh"

plugins=(git colored-man-pages docker golang git-extras kubectl)

ZSH_THEME="matipanv3"
COMPLETION_WAITING_DOTS="true"

export DOCKER_HOST=tcp://localhost:2375
export GOPATH=/mnt/c/Users/matip/capitan
export DOCKER_BUILDKIT=1
export GOPROXY=https://proxy.golang.org
export GOSUMDB=sum.golang.org
export GIT_EDITOR=vim
export GEM_HOME=$HOME/gems
export PATH=$PATH:$HOME/gems/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.linkerd2/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$GOPATH/bin

alias sz="source $HOME/.zshrc"
alias c="clear"
alias faas="faas-cli"
alias of="cd $GOPATH/src/github.com/openfaas"
alias ofi="cd $GOPATH/src/github.com/openfaas-incubator"
alias ct="cd /mnt/c/Users/matip/capitan"
source <(kubectl completion zsh)

source $ZSH/oh-my-zsh.sh

alias gh="cd $GOPATH/src/github.com/matipan"
alias gl="cd $GOPATH/src/gitlab.com/matipan"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
