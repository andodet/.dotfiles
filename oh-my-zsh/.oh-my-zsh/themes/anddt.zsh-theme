# theme based on gallois
# Depends on the git plugin for work_in_progress()

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(git_current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)%{$fg[yellow]%}%{$reset_color%}$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
    # echo "$(parse_git_dirty)%{$fg[yellow]%}%{$reset_color%}$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch | awk '{if (length($0) > 20) print substr($0,1,19)"…"; else print $0}')$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# RVM component of prompt
ZSH_THEME_RVM_PROMPT_PREFIX="%{$fg[red]%}["
ZSH_THEME_RVM_PROMPT_SUFFIX="]%{$reset_color%}"

# Combine it all into a final right-side prompt
# RPS1='$(git_custom_status)$(ruby_prompt_info) $EPS1'

function get_current_user() {
    if [ "$(whoami)" = "root" ]; then
        # echo -n "%{$fg[red]%}"
        echo -n "%{$fg_bold[red]%}"
    else
        # echo -n "%{$fg[green]%}%n%{$reset_color%}@"
        echo -n "%{$fg_bold[green]%}%n%{$reset_color%}@"
    fi
}

function get_current_host() {
   hn=$(hostname)

   # Local machines
   if [ ! "$hn" = "timesink" ] && [ ! "$hn" = "werk" ]; then
       echo -n "%{$fg[red]%}"
   fi

   echo -n "$hn"
}

function get_symbol() {
    if [ "$(whoami)" = "root" ]; then
        echo -n "#"
    else
        echo -n "$"
    fi
}

PROMPT='$(get_current_user)%{$fg_bold[yellow]%}$(get_current_host)%{$reset_color%}%{$fg[blue]%}[%~% ]$(git_custom_status)
%(?.%{$fg[green]%}.%{$fg[red]%})$(get_symbol)%b '
# PROMPT='$(get_current_user)%{$fg_bold[yellow]%}$(get_current_host)%{$reset_color%}%{$fg[blue]%}[%~% ]%(?.%{$fg[green]%}.%{$fg[red]%})$(get_symbol)%b '
