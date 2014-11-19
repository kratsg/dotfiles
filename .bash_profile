. ~/.git-prompt.sh
. $(brew --prefix root)/libexec/thisroot.sh

  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

export PYTHONSTARTUP=~/.pythonrc
PATH=/usr/local/bin:/usr/local/share/npm/bin:$PATH
PATH=/usr/local/texlive/2013/bin/x86_64-darwin:$PATH

alias atlas-jets='cd ~/Dropbox/UChicagoSchool/DavidMiller'
alias netlook='lsof -Pni'
export PS1="\[\e[1;31;40m\]Lord Stark\[\e[0m\]:\[\e[36;40m\]\w\[\e[0;37;40m\]\$(__git_ps1)\[\e[1;33;40m\]$ \[\e[0m\]"

# Load RVM into a shell session *as a function*
source ~/.profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export EDITOR=$(which vim)
