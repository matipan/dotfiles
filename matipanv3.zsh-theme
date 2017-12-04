PR_PROMPT='➜ '
# 

PROMPT=' %{$fg_bold[blue]%}%{$FG[012]%}$(git_prompt_info)%{$fg_bold[blue]%}%{$reset_color%}%{$fg_bold[blue]%}%{$FG[081]%}❯ %{$fg_bold[blue]%}%{$FG[073]%}%~
 %{$fg_bold[white]%}%{$FG[255]%}$PR_PROMPT %{$FG[012]%}\$ % %{$reset_color%}'
RPROMPT=''

# %{$FG[012]%}❯%{$FG[208]%}❯%{$FG[081]%}❯

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$FG[248]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[012]%}) %{$FG[208]%}✖%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[012]%}) "
# ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[012]%}) %{$FG[073]%} ✚"
# ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[012]%}) %{$FG[073]%} ✹"
# ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[012]%}) %{$FG[073]%} ✖"
# ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[012]%}) %{$FG[073]%} ➤"
# ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[012]%}) %{$FG[073]%} ═"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[012]%}) %{$FG[073]%} ✭"
