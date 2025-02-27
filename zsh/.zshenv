source ~/.zshenv_pvt
source ~/.zsh_clean_docker

export PYENV_VIRTUALENV_DISABLE_PROMPT=0

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

export PATH=$PATH:~/.local/bin
export RSTUDIO_CHROMIUM_ARGUMENTS="--disable-gpu"
export PATH="$PATH:/opt"
export PATH="/opt:$PATH"
export PATH="/opt/nvim-linux64/bin:$PATH"
export PATH="$PATH:/home/anddt/.local/share/coursier/bin"
export PATH="PATH=$HOME/.local/bin/godot:$PATH"

export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git --exclude node_modules'
export FZF_CTRL_F_COMMAND='fd --type d --hidden --exclude .git --exclude node_modules'
export FZF_DEFAULT_COMMAND='rg -l --exclude .git --exclude node_modules ""'
export FZF_CTRL_T_COMMAND='rg --hidden -l ""'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#838383'

export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOCONNECT=false
export VISUAL=vim
export EDITOR=vim

# Fix GKE auth lag
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Fix gsutil compatibility problems with python 3.12
export CLOUDSDK_PYTHON=$HOME/.pyenv/versions/3.10.16/bin/python3.10
export CLOUDSDK_PYTHON_SITEPACKAGES=1

export GVM_ROOT='/opt/gvm'

export GOEXE="$HOME/sdk/go1.22.7/bin/go"
#. "$HOME/.cargo/env"
