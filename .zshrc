export ZSH="/home/matipan/.oh-my-zsh"
export TERM=xterm

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting)

ZSH_THEME="matipan"
COMPLETION_WAITING_DOTS="true"

export DOCKER_BUILDKIT=1
export GOPROXY=https://proxy.golang.org
export GOSUMDB=sum.golang.org
export GIT_EDITOR=nvim
export EDITOR=nvim
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/bin/nvim-linux64/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=~/.npm-global/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin 

alias sz="source $HOME/.zshrc"
alias c="clear"
alias k="kubectl"
alias vim=nvim
alias pbcopy='xclip -sel "clip"';
alias docker-compose="docker compose";

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export TERM="xterm-256color"
export PATH=$HOME/bin:$PATH
export PATH=$HOME/code/dotfiles/bin:$PATH

bindkey -s ^f "tmux-sessionizer\n"

### Added by nube
export NUBE_TIENDANUBE_ROOT="/home/matipan/code/tiendanube/core"
eval "$(/home/matipan/.nube/bin/nube init -)"
export DOCKER_CLIENT_TIMEOUT=300
export COMPOSE_HTTP_TIMEOUT=300

### nube autocomplete fix for zsh
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit
