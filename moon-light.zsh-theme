local ret_status="%(?:%{$fg_bold[yellow]%} :%{$fg_bold[red]%} %s)"

function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

PROMPT='%{$fg[blue]%}$(get_pwd) %{$reset_color%}$(git_prompt_info)%{$reset_color%}$ret_status%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="on%{$fg[yellow]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_UNMERGED=""
ZSH_THEME_GIT_PROMPT_STAGED=""
ZSH_THEME_GIT_PROMPT_UNSTAGED=""
ZSH_THEME_GIT_PROMPT_UNTRACKED=""
ZSH_THEME_GIT_PROMPT_STASHED=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
