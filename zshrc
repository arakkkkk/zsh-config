export ZSH="$HOME/.oh-my-zsh"
# prompt theme
# ZSH_THEME="amuse"
# ZSH_THEME="avit"

fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

plugins=( 
    zsh-autosuggestions
    zsh-syntax-highlighting
    fzf-zsh-plugin
)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src


# alias
alias vi='nvim'
alian gu='git add .'
alias gu='git push'
alias gp='git pull'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gc='git checkout'
alias lg='lazygit'
alias d='docker'
alias dc='docker compose'

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

#ghq
function ghq-fzf() {
  local src=$(ghq list | fzf --preview "ls -laTp $(ghq root)/{} | tail -n+4 | awk '{print \$9\"/\"\$6\"/\"\$7 \" \" \$10}'")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq-fzf
bindkey '^g' ghq-fzf
