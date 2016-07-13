export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias ll='ls -l'
alias la='ls -al'
alias viauto='vi -S ~/auto.vimsession'
alias mail-me='tabname noomorph@gmail.com; mutt -F ~/.mutt/gmail.com'
alias mail-wix='tabname yaroslavs@wix.com; mutt -F ~/.mutt/wix.com'
alias weather="curl wttr.in/Dnepropetrovsk"
alias javaversion="java -version 2>&1 | grep -Eow '[0-9]+\.[0-9]+\.[0-9]+_[0-9]+' | head -1"

function tabname {
  printf "\e]1;$1\a"
}

function whoisonport {
    sudo lsof -i -n -P | grep TCP.*:$1
}

export PS1="\w/"

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
# export LSCOLORS=GxFxCxDxBxegedabagaced

export NODE_HOME=$(which node | sed 's/node$//')
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk$(javaversion).jdk/Contents/Home
export M3_HOME=$(brew info maven | grep Cellar | tail -n1 | sed "s/ .*//")
export M3=$M3_HOME/bin

set -o vi
