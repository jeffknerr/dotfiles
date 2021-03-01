#
# minimal bashrc additions
#

HOSTN=`hostname | awk -F. '{print $1}' | tr '[a-z]' '[A-Z]'`
PS1='\[\e[32;1m\]$HOSTN[\W]\$ \[\e[0m\]'
PS2='more> '
export HOSTN PS1 PS2 
export EDITOR=vim
export VISUAL=vim
export HISTSIZE=2500
export HISTFILESIZE=2500
umask 022
# history stuff
shopt -s histappend
export PROMPT_COMMAND='history -a'
# ---------------------------------------------------------------
# aliases 
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
export WORKON_HOME=$HOME/venvs
if [ -f /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]; then
  source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi
