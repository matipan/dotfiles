export ZSH="/home/matipan/.oh-my-zsh"
export TERM=xterm

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting)

ZSH_THEME="spaceship"
COMPLETION_WAITING_DOTS="true"

export SPACESHIP_PROMPT_ADD_NEWLINE=false
export SPACESHIP_PROMPT_SEPARATE_LINE=true
export SPACESHIP_RPROMPT_ADD_NEWLINE=true
export SPACESHIP_PROMPT_ASYNC=true
export SPACESHIP_USER_SHOW=always
export SPACESHIP_KUBECTL_SHOW=false
export SPACESHIP_PROMPT_ORDER=(
  user
  dir            # Current directory section
  host
  git            # Git section (git_branch + git_status)
  kubectl        # Kubectl context section
  aws            # Amazon Web Services section
  venv           # virtualenv section
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
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin 
export PATH=$PATH:$HOME/.gradle/gradle-8.3/bin 
export PATH=$PATH:$HOME/bin/jdt/bin 
export PATH=$PATH:/usr/lib/jvm/jdk-21/bin/

alias nstyle='docker-compose -f docker-compose.cli.yml run --rm php-cs-fixer fix --verbose --show-progress=estimating'
alias ntest='docker-compose -f docker-compose.yml -f docker-compose.override.dist.yml run --rm php-cli /application/vendor/phpunit/phpunit/phpunit --configuration /application/phpunit.xml'
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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function fix_git_php_files() {
  git status --porcelain | awk '/^M/ && /\.php$/ {print $2}' | while read -r file; do
    nstyle "$file"
  done
}

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

eval $(thefuck --alias)

function uberwatch {
    # call: uberwatch <interval> <command>
    while true; do
        "${@:2}";
        sleep $1;
    done
}
