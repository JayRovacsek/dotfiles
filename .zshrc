export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="risto"
HYPHEN_INSENSITIVE="true"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi


# Custom env:
export PYTHONWARNINGS="ignore:Unverified HTTPS request"
export UPDATE_ZSH_DAYS=3
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Application aliases
alias nano=vim
alias l="lsd -al"
alias ls="lsd"
alias python='python3'
alias pip='pip3'

# Scripts
alias monitor="~/dev/internal/scripts/progress.sh"
alias count="~/dev/internal/sh/scripts/count_files.sh"
alias fix_rqp=". .~/dev/internal/scripts/fix_rqp.sh"
alias unset_rqp=". ./~/dev/internal/scripts/unset_rqp.sh"
alias vscode="/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron"
alias update="~/dev/internal/sh/scripts/update.sh"

# Custom folders internal dev
alias didv="~/dev/internal/"
alias dic="~/dev/internal/config/"
alias dics="~/dev/internal/cs/"
alias did="~/dev/internal/docker/"
alias digo="~/dev/internal/Go/"
alias dij="~/dev/internal/java/"
alias dijs="~/dev/internal/js/"
alias dio="~/dev/internal/other/"
alias dips="~/dev/internal/ps/"
alias dipy="~/dev/internal/py/"
alias dirb="~/dev/internal/rb/"
alias dirs="~/dev/internal/rs/"
alias dish="~/dev/internal/sh/"
alias dit="~/dev/internal/tex/"
alias didrt="~/dev/internal/dart/"

# Custom folders external dev
alias dedv="~/dev/external/"
alias dec="~/dev/external/config/"
alias decs="~/dev/external/cs/"
alias ded="~/dev/external/docker/"
alias dego="~/dev/external/Go/"
alias dej="~/dev/external/java/"
alias dejs="~/dev/external/js/"
alias deo="~/dev/external/other/"
alias deps="~/dev/external/ps/"
alias depy="~/dev/external/py/"
alias derb="~/dev/external/rb/"
alias ders="~/dev/external/rs/"
alias desh="~/dev/external/sh/"
alias det="~/dev/external/tex/"
alias dedrt="~/dev/external/dart/"

GOPATH=~/dev/internal/Go
GOROOT=~/dev/internal/Go
export PATH="$PATH:~/.gem/ruby/2.3.0/bin"
export PATH="$PATH:/usr/local/bin/flutter/bin"
export PATH="$PATH:~/dev/flutter/bin"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

export PATH="/usr/local/opt/openjdk/bin:$PATH"

export WASMTIME_HOME="~/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

eval "$(starship init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jrovacsek/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jrovacsek/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/jrovacsek/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jrovacsek/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

