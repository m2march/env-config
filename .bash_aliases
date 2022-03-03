# Abrir cosas desde la consola (carpetas, archivos, lo que sea, es como dar
# doble click)
alias open="xdg-open"

# xclip aliases
alias copy="xclip -i -selection clipboard"
alias paste="xclip -o -selection clipboard"

# cd aliases
alias ..="cd .."
base=".."
for i in $(seq 1 9)
do
    alias ..$i="cd "$base
    base=$base"/.."
done

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# reset display after ssh
alias remir="export DISPLAY=:0"

# sshs
alias zorzal="ssh -L 9008:localhost:9008 -L 9010:eisendrache.liaa.inv.dc.uba.ar:22 mmiguel@zorzal.dc.uba.ar"
alias eisen="ssh -X -p 9010 march@localhost"
alias eisen_fs="sshfs -p 9010 march@localhost:/home/march eisen"

zorzalret() { 
	ssh -R 9008:localhost:$1 mmiguel@zorzal.dc.uba.ar 
}

alias notebook="jupyter notebook"
alias byobu_clear="/usr/lib/byobu/include/tmux-detach-all-but-current-client"
