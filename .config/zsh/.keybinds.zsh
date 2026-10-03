zle -N exit_zsh
bindkey '^D' exit_zsh

zle -N clear-screen-and-scrollback
bindkey '^L' clear-screen-and-scrollback

zle -N expand-dot-to-parent-directory-path
bindkey -M emacs "." expand-dot-to-parent-directory-path
bindkey -M viins "." expand-dot-to-parent-directory-path
bindkey -M isearch "." self-insert
