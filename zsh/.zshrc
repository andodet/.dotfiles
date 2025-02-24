# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
ps1_user="%(!.%{$fg[red]%}.%{$fg[green]%})%n"
ps1_host="%{$fg[blue]%}%M"
ps1_remote_host="%{$fg[red]%}%M"
ps1_remote_prefix="%{$fg[red]%}R>"
ps1_path="%{$fg[cyan]%}[%~]"
ps1_suffix="%(?.%{$fg[green]%}.%{$fg[red]%})%(!.#.$)"
ps1_prefix=""

if [ -n "$LEVELS_OF_VIM" ]; then
    ps1_prefix="$ps1_prefix%B%{$fg[red]%}(VIM+$LEVELS_OF_VIM)%{$reset_color%}%b "
fi

if [ -z "$SSH_CLIENT" ]; then
    # Local login
    PS1="$ps1_prefix%B$ps1_user $ps1_host%b$ps1_path%B$ps1_suffix%{$reset_color%}%b "
else
    # Login through SSH
    PS1="$ps1_prefix%B$ps1_remote_prefix$ps1_user $ps1_remote_host%b$ps1_path%B$ps1_suffix%{$reset_color%}%b "
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/anddt/.oh-my-zsh"
unsetopt BEEP

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="anddt"
ZSH_THEME="anddt"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    zsh-kitty
    web-search
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# Users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Pyenv settings
#if command -v pyenv 1>/dev/null 2>&1; then
#  eval "$(pyenv init -)"
#fi
#eval "$(pyenv virtualenv-init -)"
pyenv() {
    eval "$(command pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
}

# Set up radian R console
alias r="python -m radian"

# Set up direnv hook
eval "$(direnv hook zsh)"

# Export python libs (e.g black and flake8)
export PATH=$PATH:~/.local/bin

alias ngrok="/opt/ngrok"
alias pe="pyenv"
alias dc="docker compose"
alias todo="nv ~/todo.md"
alias dcai="dc run ai"  
alias nau="nautilus"
alias nv="nvim"
alias v="vim"
alias V="sudo vim"
alias icat="kitty +kitten icat"
alias vs-line-reset="python ~/reset_vscode_ln.py"
alias dkr="docker"
alias ktdark="source ~/.config/kitty/toggle_theme.sh"
alias tm="tmux"
alias kssh="kitten ssh"
alias imv="imv-x11"
alias jb="jupyter lab"
alias dkrpr="docker system prune -f"

# Open a new tmux session in a target directory
function tmux_sessionizer() {
    eval "$(bash $HOME/tmux-sessionizer>/dev/null)"
}
zle -N tmux_sessionizer{,}
bindkey ^f tmux_sessionizer

fuzzy_ls() {
    chosen="$(fd '.' -t d | fzf -0 --prompt 'fuzzy ls: ')"
    if [[ -n "$chosen" ]]; then
        LBUFFER+="$chosen"
    else
        LBUFFER+=""
    fi
}

zle -N fuzzy_ls
bindkey ^f fuzzy_ls

# Restore delete up beginning of line
bindkey \^U backward-kill-line
#bindkey -s ^f "bash /opt/tmux-sessionizer\n"


# fzf settings
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND='rg --files --hidden'
source /usr/share/fzf/key-bindings.zsh

# helper function to open files in nautilus
op() {
    nohup thunar $1 > /dev/null 2>&1 &
}

xop() {
    nohup xdg-open $1 > /dev/null 2>&1 &
}

set_terminal_title() {
    # escape '%' chars in $1, make nonprintables visible
    local a=${(V)1//\%/\%\%}

    # Truncate command, and join lines.
    a=${a//[$'\r'$'\n']/}

    [ "$a" = "zsh" ] && { a=${(%)${:-%~}} }

    case $TERM in
    screen*|tmux*)
        # plain xterm title
        print -rn -- $'\e'"]2;${(%)${:-%m}}: $a"$'\a'

        # screen title (in ^A")
        print -rn -- $'\e'"k$a"$'\e'$'\\'

        # screen location
        print -rn -- $'\e'"_${(%)${:-%m}}: $a"$'\e'$'\\'
    ;;
    xterm*|rxvt*|kitty*)
        # plain xterm title
        print -rn -- $'\e'"]2;${(%)${:-%m}}: $a"$'\a'
    ;;
    esac
}

my_prompt_precmd() {
    set_terminal_title "zsh"
}

my_prompt_preexec() {
    set_terminal_title "$1"
}

chpwd_functions=(my_prompt_preexec)

typeset -ga precmd_functions
precmd_functions+=my_prompt_precmd

typeset -ga preexec_functions
preexec_functions+=my_prompt_preexec

__kitty_complete

eval "$(zoxide init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-cli/path.zsh.inc' ]; then . '/opt/google-cloud-cli/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-cli/completion.zsh.inc' ]; then . '/opt/google-cloud-cli/completion.zsh.inc'; fi
