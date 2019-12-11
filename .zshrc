# If not running interactively, do not do anything
[[ $- != *i* ]] && return
# Otherwise start tmux
[[ -z "$TMUX" ]] && exec tmux

export ZSH="/home/matipan/.oh-my-zsh"

plugins=(git colored-man-pages docker golang git-extras)

ZSH_THEME="matipanv3"
COMPLETION_WAITING_DOTS="true"

export GOPATH=/home/matipan
export DOCKER_BUILDKIT=1
export GOPROXY=https://proxy.golang.org
export GOSUMDB=sum.golang.org
export GIT_EDITOR=vim
export EDITOR=nvim
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.linkerd2/bin
export PATH=$PATH:$GOPATH/bin
export PATH=~/.npm-global/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"

alias sz="source $HOME/.zshrc"
alias c="clear"
alias faas="faas-cli"
alias k="kubectl"
alias open="xdg-open"
alias headset="python3 $HOME/bluetooth/a2dp.py 04:5D:4B:66:88:42"

source $ZSH/oh-my-zsh.sh

alias gh="cd $GOPATH/src/github.com/matipan"
alias gl="cd $GOPATH/src/gitlab.com/matipan"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source <(kubectl completion zsh)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/matipan/google-cloud-sdk/path.zsh.inc' ]; then . '/home/matipan/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/matipan/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/matipan/google-cloud-sdk/completion.zsh.inc'; fi
