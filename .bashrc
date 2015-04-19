alias v='vim'
alias vi='vim'
alias ll='ls -al'
alias rss='newsbeuter -r'
alias viauto='vi -S ~/auto.vimsession'
alias mail-some='tabname mail@gmail.com; mutt -F ~/.mutt/gmail.com'

function tabname {
  printf "\e]1;$1\a"
}

export PS1="\w/"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export NODE_HOME=$(which node | sed 's/node$//')
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home/jre"

export M2_HOME=$(brew info maven | grep Cellar | sed "s/ .*//")
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xmx1g -XX:MaxPermSize=256m"

# export PORT=8081
# export SASS_PATH=.
# export PATH=$PATH:$M2

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

rvm use 2.2.1
nvm use 0.10
