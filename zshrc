# If you come from bash you might have to change your $PATH.
export PATH=/sbin:/usr/sbin:/usr/swat/bin:$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# share history????
setopt inc_append_history
setopt share_history

# Set name of the theme to load. 
#ZSH_THEME="robbyrussell"
ZSH_THEME="jkblinks"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# ##########################################################
alias -g L="|less"
alias -g TL="|tail -20"
hash -d cs=~/classes/cs21/current
hash -d drop=~/repos/mydrop
# ##########################################################
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export PYTHONSTARTUP=${HOME}/.pythonrc
export EDITOR="vim"
export VISUAL="vim"
export HISTSIZE=3500
export HISTFILESIZE=3500
umask 022

# must do these as shell functions???
function cl { 
  pre=$(basename -s ".cpp" $1)
  clang++ -std=c++11 $1 -o $pre  
}
function bcu { sudo -H -i -u $1; }
function hcs { host 130.58.68.$1; }
function mp4 { mpage -4f  $1 | lp; }
function mp2 { mpage -2f $1 | lp; }
function pdiary { mutt -R -f /usr/swat/staff/diary/$1; }
function rdiary { mutt -R -f /usr/swat/staff/root-diary/$1; }
function mcd () { mkdir -p "$1" ; cd "$1" ; }
function marco () { export MPDIR="$PWD"; }
function polo () { cd $MPDIR; }

export WORKON_HOME=$HOME/venvs
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#446644,bg=black,underline"

export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
