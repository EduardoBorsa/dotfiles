~/.bin/ensure-tmux-is-running

source ~/.config/zsh/env.sh
source ~/.config/zsh/theme.zsh

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

source ~/.config/zsh/bindings.zsh
source ~/.config/zsh/cmds.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/history.zsh
source ~/.config/zsh/vendor.zsh

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"


bindkey -s '^R' "~/.bin/fzf-history-call.sh\n"

# bindkey -s '\eb' '^u/path/to/script.sh^M'

eval "$(starship init zsh)"
