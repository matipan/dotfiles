# make some aliases for the colors: (could use normal escape sequences too)
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval PR_$color='%{$fg[${(L)color}]%}'
done
eval PR_NO_COLOR="%{$terminfo[sgr0]%}"
eval PR_BOLD="%{$terminfo[bold]%}"

PR_PROMPT='➤'

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

PROMPT='%{$fg_bold[white]%}╭─ %{$fg[yellow]%}%~ %{$fg_bold[cyan]%}❯%{$fg_bold[green]%}❯%{$fg_bold[gray]%}❯ %{$fg_bold[cyan]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}
%{$fg_bold[white]%}╰─%{$fg_bold[white]%}$PR_PROMPT %{$fg[red]%}\$ % %{$reset_color%}'
RPROMPT=''

#${ret_status}%{$fg_bold[green]%}%p

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[gray]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[cyan]%}) %{$fg[yellow]%}✗ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%})"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[cyan]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[cyan]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[cyan]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
