
case $- in
	*i*) ;; # Interactive mode
	*) return ;;
esac

#---------- env variables ----------  
export GITUSER="$USER"
export GHREPOS="$HOME/repos/github.com/$GITUSER"
export DOTFILES="$HOME/repos/github.com/$GITUSER/dot"


export EDITOR=vim
export TERM=xterm-256color


# ---------- aliases ---------- 
alias scripts='cd $SCRIPTS'
alias ll='ls -l'

function cdl {
	local dir="$(dirname $(readlink -e $1))"
	test -n "$dir" && cd $dir
}

pathappend() {
  declare arg
  for arg in "$@"; do
    test -d "${arg}" || continue
    PATH=${PATH//:${arg}:/:}
    PATH=${PATH/#${arg}:/}
    PATH=${PATH/%:${arg}/}
    export PATH="${PATH:+"${PATH}:"}${arg}"
  done
}

pathprepend() {
  for ARG in "$@"; do
    test -d "${ARG}" || continue
    PATH=${PATH//:${ARG}:/:}
    PATH=${PATH/#${ARG}:/}
    PATH=${PATH/%:${ARG}/}
    export PATH="${ARG}${PATH:+":${PATH}"}"
  done
}

export SCRIPTS=~/.local/bin/scripts
mkdir -p "$SCRIPTS" &>/dev/null

# last arg will be first in path
pathprepend \
	/usr/local/go/bin \
	~/.local/bin \
	"$SCRIPTS"

pathappend \
  /usr/local/opt/coreutils/libexec/gnubin \
  /mingw64/bin \
  /usr/local/bin \
  /usr/local/sbin \
  /usr/games \
  /usr/sbin \
  /usr/bin \
  /snap/bin \
  /sbin \
  /bin

# ---------- cdpath ----------   
export CDPATH=.:\
~/repos/github.com:\
~/repos/github.com/$GITUSER:\
~/repos/github.com/$GITUSER/dot:\
~/repos:\
/media/$USER:\
~

