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

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi

# Custom env:
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Application aliases
alias nano=vim
alias l="lsd -al"
alias ls="lsd"
alias python='python3'
alias pip='pip3'

# Scripts
alias monitor="~/dev/work/scripts/progress.sh"
alias count="~/dev/work/scripts/count_files.sh"
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias vscode="/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron"
fi

# Custom folders work dev
alias didv="~/dev/work/"
alias dic="~/dev/work/config/"
alias dics="~/dev/work/cs/"
alias did="~/dev/work/docker/"
alias digo="~/dev/work/Go/"
alias dij="~/dev/work/java/"
alias dijs="~/dev/work/js/"
alias dio="~/dev/work/other/"
alias dips="~/dev/work/ps/"
alias dipy="~/dev/work/py/"
alias dirb="~/dev/work/rb/"
alias dirs="~/dev/work/rs/"
alias dish="~/dev/work/sh/"
alias dit="~/dev/work/tex/"
alias didrt="~/dev/work/dart/"

# Custom folders personal dev
alias dedv="~/dev/personal/"
alias dec="~/dev/personal/config/"
alias decs="~/dev/personal/cs/"
alias ded="~/dev/personal/docker/"
alias dego="~/dev/personal/Go/"
alias dej="~/dev/personal/java/"
alias dejs="~/dev/personal/js/"
alias deo="~/dev/personal/other/"
alias deps="~/dev/personal/ps/"
alias depy="~/dev/personal/py/"
alias derb="~/dev/personal/rb/"
alias ders="~/dev/personal/rs/"
alias desh="~/dev/personal/sh/"
alias det="~/dev/personal/tex/"
alias dedrt="~/dev/personal/dart/"

if [[ "$OSTYPE" == "darwin"* ]]; then
	GOPATH=~/dev/work/Go
	GOROOT=~/dev/work/Go
	export PATH="$PATH:~/.gem/ruby/2.3.0/bin"
	export PATH="$PATH:/usr/local/bin/flutter/bin"
	export PATH="$PATH:~/dev/flutter/bin"
fi

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

export WASMTIME_HOME="~/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"
export PATH="/usr/bin:$PATH"

eval "$(starship init zsh)"
