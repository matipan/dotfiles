ZSH_THEME="matipanv3"
COMPLETION_WAITING_DOTS="false"

plugins=(git brew colored-man-pages docker golang git-extras k)

export ZSH=/home/matias.pan/.oh-my-zsh
export EDITOR='nvim'
export SSH_KEY_PATH="~/.ssh/rsa_id"
export MANPATH="/usr/local/man:$MANPATH"
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/bin/gonvim
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
export GIT_EDITOR="vim"
export XDG_CONFIG_HOME=$HOME/.config
export PATH=$PATH:/home/matias.pan/.local/bin
export GO111MODULE=off

alias sov="source /opt/intel/computer_vision_sdk/bin/setupvars.sh && source $GOPATH/src/gocv.io/x/gocv/openvino/env.sh"
alias lg='/bin/zsh --login'
alias sz='source ~/dotfiles/.zshrc'
alias nvimrc='nvim ~/.config/nvim/init.vim'
alias nvimz='nvim ~/dotfiles/.zshrc'
alias n='nvim'
alias go14="docker run -v $(pwd):/src/app -w /src/app golang:1.4 go"
alias go18="docker run -v $(pwd):/src/app -w /src/app golang:1.8 go"
alias facade="cd $GOPATH/src/github.com/spiritclips/svod-facade"
alias svodsdk="cd $GOPATH/src/github.com/spiritclips/platform-clientlib-go"
alias rmdocker="docker rm -f $(docker ps -aq)"
alias gnvim="gonvim.sh &>/dev/null &"

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH='/bin:/sbin':"$PATH"
export PATH='/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin':"$PATH"
