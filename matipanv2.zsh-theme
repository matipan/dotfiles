# make some aliases for the colors: (could use normal escape sequences too)
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval PR_$color='%{$fg[${(L)color}]%}'
done
eval PR_NO_COLOR="%{$terminfo[sgr0]%}"
eval PR_BOLD="%{$terminfo[bold]%}"

PR_PROMPT='➤'

PROMPT='%{$fg_bold[white]%}%{$FG[255]%}╭─ %{$FG[073]%}%~ %{$FG[012]%}❯%{$FG[081]%}❯%{$FG[073]%}❯ %{$FG[012]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}
%{$fg_bold[white]%}%{$FG[255]%}╰─%{$fg_bold[white]%}%{$FG[255]%}$PR_PROMPT %{$FG[012]%}\$ % %{$reset_color%}'
RPROMPT=''

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$FG[248]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[012]%}) %{$FG[073]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[012]%})"
ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[012]%}) %{$fg[cyan]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[012]%}) %{$fg[cyan]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[012]%}) %{$fg[cyan]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[012]%}) %{$fg[cyan]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[012]%}) %{$fg[cyan]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[012]%}) %{$fg[cyan]%} ✭"
