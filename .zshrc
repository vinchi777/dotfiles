# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jude/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

#
# PURE PROMPT
#
PURE_PROMPT_SYMBOL=🦄
PROMPT='%(1j.[%j] .)%(?.%F{magenta}.%F{red})${PURE_PROMPT_SYMBOL:-❯}%f '

zstyle :prompt:pure:git:branch color magenta

#
# ALIASES
#
alias vim="nvim"
alias vi="nvim"
alias be="bundle exec"
alias open="xdg-open"
alias rebootwindows="systemctl reboot --boot-loader-entry=auto-windows -i"
alias mom='cd /home/jude/HDD/Javascript/mom-dot-com'
alias dim='f() { xrandr --output DP-0 --brightness 0.$1. };f'


export EDITOR='nvim'
# Fzf preview highlight theme
export BAT_THEME='OneHalfLight'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# fbl - checkout git branch, sorted by most recent commit
fbl() {
  local branches branch
  branches=$(git branch --sort=-committerdate --format="%(refname:short)") &&
  branch=$(echo "$branches" | fzf +m --preview="git log -3 '{1}'") &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export EDITOR='nvim'
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
export PATH=/home/jude/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=${PATH}:$(go env GOPATH)/bin
export DOCKER_HOST=unix:///run/user/1000/docker.sock

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/"
#[ -n "$PS1" ] && \
    #[ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        #eval "$("$BASE16_SHELL/profile_helper.sh")"
export FIREBASE_AUTH_EMULATOR_HOST=localhost:9099
export PATH="/home/jude/.local/share/solana/install/active_release/bin:$PATH"
