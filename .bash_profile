alias v='vim'
alias vi='vim'
alias ll='ls -al'
alias mvi='mvim'
alias rss='newsbeuter -r'
alias nvim='osascript ~/dotfiles/nvim.scpt'
alias viauto='vi -S ~/auto.vimsession'
alias karma-spec='karma start --reporters spec'
alias karma-coverage='karma start --reporters coverage'

export PATH=/usr/local/bin:$PATH 
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export CTAGS="-R --exclude=.git"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

function tabname {
  printf "\e]1;$1\a"
}
