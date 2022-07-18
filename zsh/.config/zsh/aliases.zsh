#!/usr/bin/env sh

alias reboot='sudo reboot'
alias open='xdg-open'

# eval "$(hub alias -s)"

# one-char aliases
alias a=ag
alias b=bundle
alias m=mix
alias dc='docker-compose'
alias d=docker
alias g=hub
alias git=hub
alias h=heroku
alias o=open
alias r=rails
alias v=nvim
alias va=vagrant
alias x=extract
alias y=yay
alias s=bin/server
alias u=utrust
alias c=bin/console
alias l=leetcode
alias prisma-fmt=/home/dado/.asdf/installs/nodejs/16.16.0/.npm/lib/node_modules/prisma/node_modules/@prisma/engines/prisma-fmt-debian-openssl-3.0.x

# rust replacements
# https://zaiste.net/posts/shell-commands-rust
alias ls=exa
alias cat=bat
alias ps=procs

# thoughtbot/parity
alias prod=production
alias stag=staging
alias sand=sandbox
alias dev=development

function g() { git "$@" }
function f () { "$@" | fzf }

alias tn='tmux new -s'
alias ta='tmux attach -t'
alias tl='tmux list-sessions'
alias ts='tmux switch -t'
alias td='tmux detach'
alias tk='tmux kill-session -t'
alias tt='tmux choose-tree'

# cd
#alias cd='cdls'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

# alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias vim=nvim

alias luamake=/home/dado/programs/lua-language-server/3rd/luamake/luamake
