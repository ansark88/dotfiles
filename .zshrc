#chsh¥³¥Þ¥ó¥É /bin/zsh¤«¤éÊÑ¹¹¤¹¤ë

#Êä´°¤òÍ­¸ú,Êä´°¤Ë¿§¤ò¤Ä¤±¤ë
autoload -U compinit && compinit
zstyle ':completion:*' list-colors ''

#cd -[tab]¤Ç°ÜÆ°ÍúÎò¡¢¥ª¥Ú¥ì¡¼¥¿¤Î³ÈÄ¥(Àµµ¬É½¸½¤Ã¤Ý¤¯¤¹¤ë)
setopt auto_pushd 
setopt extended_glob
setopt nolistbeep

#¥ê¥¹¥È¤ò¥³¥ó¥Ñ¥¯¥È¤Ë¡¢¥³¥Þ¥ó¥É¥ß¥¹¤ò»ØÅ¦
setopt list_packed 
setopt correct 

#history¤òC-p C-n¤Ç¸¡º÷¤ò¤«¤±¤ë
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward

#history¡¢½ÅÊ£ÊÝÂ¸¤Ê¤·
HISTFILE=$HOME/.zsh-history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups hist_save_nodups
setopt share_history

PS1=""


#http://journal.mycom.co.jp/column/zsh/002/index.html
#case ${UID} in
#	0)
#	PROMPT="%B%{[31m%}%/#%{[m%}%b "
#	PROMPT2="%B%{[31m%}%_#%{[m%}%b "
#	SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
#	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#	PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
#	;;
#	*)
#	PROMPT="%{[31m%}%/%%%{[m%} "
#	PROMPT2="%{[31m%}%_%%%{[m%} "
#	SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
#	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#	PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
#	;;
#esac

#http://blog.blueblack.net/item_207
autoload colors
colors
PROMPT="%{${fg[blue]}%} %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"

#From bashrc

#BSD ls color
alias ls='ls -GF'

#PATH
export PATH=/usr/local/teTex/bin:$PATH
export MANPATH=/usr/local/teTex/man:/usr/local/git:$MANPATH
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/git:$PATH

#alias
alias mydate='date +%Y-%m-%d'
