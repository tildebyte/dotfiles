alias ls='ls -F --group-directories-first --color=always '
alias l.='ls -A '
alias dir='ls -lh '
alias dir.='dir -A '
alias guntar='tar -zxvf '
alias buntar='tar -jxvf '
alias xuntar='tar -Jxvf '
alias untar='tar -xvf '
alias xuntar='tar -Jxvf '
alias gtlist='tar -ztvf '
alias btlist='tar -jtvf '
alias xtlist='tar -Jxvf '
alias tlist='tar -tvf '
alias gvim-tab='gvim -p --remote-tab-silent '
alias grep='grep --color=auto '
alias fgrep='fgrep --color=auto '
alias egrep='egrep --color=auto '
alias dirt='dir. -rt '
alias cp='cp -v '

case "$TERM" in
xterm*)
	# The following programs are known to require a Win32 Console
	# for interactive usage, therefore let's launch them through winpty
	# when run inside `mintty`.
	for name in node ipython php php5 psql python2.7
	do
		case "$(type -p "$name".exe 2>/dev/null)" in
		''|/usr/bin/*) continue;;
		esac
		alias $name="winpty $name.exe"
	done
	;;
esac
