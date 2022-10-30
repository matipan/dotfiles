PR_PROMPT='➜ '

nix_shell() {
	if [[ -n "$IN_NIX_SHELL" ]]; then
		echo -n "%{$fg_bold[blue]%}%{$FG[010]%}㋡"
	fi
}

PROMPT='$(nix_shell) %{$fg_bold[blue]%}%{$FG[012]%}$(git_prompt_info)%{$fg_bold[blue]%}%{$reset_color%}%{$fg_bold[blue]%}%{$FG[081]%} ▸ %{$fg_bold[blue]%}%{$FG[073]%}%~
 %{$fg_bold[white]%}%{$FG[255]%}$PR_PROMPT %{$FG[012]%}\$ % %{$reset_color%}'
RPROMPT=''

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$FG[248]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[012]%}) %{$FG[208]%}✖%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[012]%}) "
