export ZSH="/home/matipan/.oh-my-zsh"
export TERM="xterm-256color"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

ZSH_THEME="spaceship"
COMPLETION_WAITING_DOTS="true"

export SSH_AUTH_SOCK=~/.1password/agent.sock

export SPACESHIP_DIR_COLOR="#7aa2f7"
export SPACESHIP_PROMPT_ADD_NEWLINE=false
export SPACESHIP_PROMPT_SEPARATE_LINE=true
export SPACESHIP_RPROMPT_ADD_NEWLINE=true
export SPACESHIP_PROMPT_ASYNC=true
export SPACESHIP_USER_SHOW=always
export SPACESHIP_KUBECTL_SHOW=false
export SPACESHIP_PROMPT_ORDER=(
  dir            # Current directory section
  host
  git            # Git section (git_branch + git_status)
  kubectl        # Kubectl context section
  aws            # Amazon Web Services section
  java
  exec_time      # Execution time
  line_sep       # Line break
  sudo           # Sudo indicator
  char           # Prompt character
)

export DOCKER_BUILDKIT=1
export GOPRIVATE="github.com/ninjastructure/*"
export GOPROXY=https://proxy.golang.org
export GOSUMDB=sum.golang.org
export GIT_EDITOR=nvim
export EDITOR=nvim
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/bin/nvim-linux64/bin
export PATH=$PATH:$HOME/bin/idea/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=~/.npm-global/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/zig/
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin 
export PATH=$PATH:$HOME/.gradle/gradle-8.3/bin 
export PATH=$PATH:$HOME/bin/jdt/bin 
export PATH=$PATH:/usr/lib/jvm/jdk-21/bin/
export PATH=$HOME/dotfiles/bin:$PATH
export PATH=$HOME/bin:$PATH
# Set 1password SSH integration and let 1Password manage keys
export SSH_AUTH_SOCK=~/.1password/agent.sock

alias gw="git worktree"
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias sz="source $HOME/.zshrc"
alias c="clear"
alias k="kubectl"
alias vim=nvim
alias pbcopy='wl-copy';
alias docker-compose="docker compose";
alias gc="git commit -s"
# Who the fuck cares about ghostscript?
alias gs="git status -sb"

source $ZSH/oh-my-zsh.sh

source <(fzf --zsh)


bindkey -s ^f "tmux-sessionizer\n"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval $(thefuck --alias)

function awsp() {
	export AWS_PROFILE=$1
}

_direnv_hook() {
  trap -- '' SIGINT;
  eval "$(direnv export zsh)";
  trap - SIGINT;
}
typeset -ag precmd_functions;
if [[ -z "${precmd_functions[(r)_direnv_hook]+1}" ]]; then
  precmd_functions=( _direnv_hook ${precmd_functions[@]} )
fi
typeset -ag chpwd_functions;
if [[ -z "${chpwd_functions[(r)_direnv_hook]+1}" ]]; then
  chpwd_functions=( _direnv_hook ${chpwd_functions[@]} )
fi

source ~/.env

# bun completions
[ -s "/home/matipan/.bun/_bun" ] && source "/home/matipan/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
