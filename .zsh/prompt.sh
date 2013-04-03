# Fork from https://gist.github.com/214109

# git のブランチ名 *と作業状態* を zsh の右プロンプトに表示＋ status に応じて色もつけてみた
# Blog: http://d.hatena.ne.jp/uasi/20091025/1256458798
# Git Only
# {{{
autoload colors
colors

autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'

function rprompt-git-current-branch {
  local name st color gitdir action
  if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
      return
  fi

  name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
  if [[ -z $name ]]; then
      return
  fi

  gitdir=`git rev-parse --git-dir 2> /dev/null`
  action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

  st=`git status 2> /dev/null`
  if [[ "$st" =~ "(?m)^nothing to" ]]; then
      color=%F{green}
  elif [[ "$st" =~ "(?m)^nothing added" ]]; then
      color=%F{yellow}
  elif [[ "$st" =~ "(?m)^# Untracked" ]]; then
      color=%B%F{red}
  else
      color=%F{red}
  fi
  echo "$color$name$action%f%b "
}
# }}}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst
# PCRE 互換の正規表現を使う
setopt re_match_pcre
# Hide right prompt when input reach it.
setopt transient_rprompt

autoload -Uz vcs_info

precmd () {
  local ruby_version \
        current_working_directory \
        current_branch \
        vcs_prompt \
        psvar

  ruby_version=`rbenv version | sed -e 's/ .*//'`
  current_working_directory="%~"
  current_branch=$(rprompt-git-current-branch)
  # VCS info
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  psvar[1]=$vcs_info_msg_0_
  if [ "$current_branch" = "" ]; then
    vcs_prompt="%f%1v "
  else
    vcs_prompt="$current_branch"
  fi

  # Left prompt. -> Output
  PROMPT="%{$fg[red]%}(rbenv:$ruby_version)%{$reset_color%}"
  PROMPT="$PROMPT $vcs_prompt%{$reset_color%}"
  PROMPT="$PROMPT "$'\n'"$USER> %(!.#.$) %{$reset_color%}"

  # Right prompt. -> Output.
  RPROMPT="[${current_working_directory}]"
}
