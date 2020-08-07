# Adding custom directory
PATH="/Users/merrill/Cust_progs:${PATH}"
export PATH

export EDITOR=nano

#For colors
# export PS1="\[\033[32m\]\h \[\033[33;1m\]\w\[\033[m\] \$ \n> "
export PS1="   \[\033[32m\]\h \[\033[33;1m\]\w\[\033[m\] \$(git branch 2>/dev/null | grep '^*' | colrm 1 2) \$  \n➜ "
export PS2="➜ "
export CLICOLOR=1
export LSCOLORS=GxFxBxDxCxegedabagacad
alias ls='ls -GFh'
alias oops='sudo !!'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# added by Anaconda3 5.2.0 installer
export PATH="/Users/merrill/anaconda3/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
