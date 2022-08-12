export ZSH="/Users/matipan/.oh-my-zsh"
export TERM=xterm

plugins=(git)

ZSH_THEME="matipanv3"
COMPLETION_WAITING_DOTS="true"

export GOPATH=/Users/matipan
export DOCKER_BUILDKIT=1
export GOPROXY=https://proxy.golang.org
export GOSUMDB=sum.golang.org
export GIT_EDITOR=nvim
export EDITOR=nvim
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/lemon/lemi/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=~/.npm-global/bin:$PATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-17.0.4.jdk/Contents/Home
export AWS_PROFILE=admin
export AWS_REGION=sa-east-1

alias sz="source $HOME/.zshrc"
alias c="clear"
alias k="kubectl"
alias vim=nvim
alias loginaws="aws sso login --profile admin"
alias code="code --disable-gpu"

source $ZSH/oh-my-zsh.sh

alias gh="cd $GOPATH/src/github.com/matipan"
alias gl="cd $GOPATH/src/gitlab.com/matipan"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
