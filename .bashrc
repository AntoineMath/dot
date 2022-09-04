
case $- in
	*i*) ;; # Interactive mode
	*) return ;;
esac

#---------- env variables ----------  
export GITUSER="$USER"
export GHREPOS="$HOME/repos/gitub.com/$GITUSER"
export DOTFILES="$HOME/repos/gitub.com/$GITUSER/dot"

export EDITOR=vim
export TERM=xterm-256color


# ---------- aliases ---------- 
alias scripts='cd $SCRIPTS'

function cdl {
	local dir="$(dirname $(readlink -e $1))"
	test -n "$dir" && cd $dir
}
