export PS1="\w/"
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
# export LSCOLORS=GxFxCxDxBxegedabagaced

export NODE_HOME=$(which node | sed 's/node$//')
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk$(javaversion).jdk/Contents/Home
export M3_HOME=$(brew info maven | grep Cellar | tail -n1 | sed "s/ .*//")
export M3=$M3_HOME/bin

export PATH="/usr/local/sbin:$PATH"
