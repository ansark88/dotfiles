#chshコマンド /bin/zshから変更する

#補完を有効,補完に色をつける
autoload -U compinit && compinit
zstyle ':completion:*' list-colors ''

#cd -[tab]で移動履歴、オペレータの拡張(正規表現っぽくする)
setopt auto_pushd 
setopt extended_glob
setopt nolistbeep

#リストをコンパクトに、コマンドミスを指摘
setopt list_packed 
setopt correct 

#historyをC-p C-nで検索をかける
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward

#history、重複保存なし
HISTFILE=$HOME/.zsh-history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups hist_save_nodups
setopt share_history

# path
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

. "$HOME/.local/bin/env"

eval "$(starship init zsh)"
