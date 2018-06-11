alias ll="ls -la"

function whoisonport {
    sudo lsof -i -n -P | grep TCP.*:$1
}

function weather {
    curl wttr.in/$1
}

function bak()
{
    if [[ $# -ne 1 ]]; then
        echo "You're doing it wrong. Usage: bak <filename>"
    else
        mv ${1} "${1}.bak"
    fi
}

function unbak()
{
    if [[ $# -ne 1 ]]; then
        echo "You're doing it wrong. Usage: unbak <filename>.bak"
    else
        echo ${1} | grep ".bak" &> /dev/null

        if [[ $? -ne 0 ]]; then
            echo "You're doing it wrong. File doesn't have .bak."
        else
            mv ${1} "${1%.*}"
        fi
    fi
}

# LINUX

# alias pbcopy='xclip -selection clipboard'
# alias pbpaste='xclip -selection clipboard -o'

# NOT IN USE

# alias mail-me='tabname noomorph@gmail.com; mutt -F ~/.mutt/gmail.com'
# alias mail-wix='tabname yaroslavs@wix.com; mutt -F ~/.mutt/wix.com'
# alias javaversion="java -version 2>&1 | grep -Eow '[0-9]+\.[0-9]+\.[0-9]+_[0-9]+' | head -1"
#
# function tabname {
#   printf "\e]1;$1\a"
# }
#
#
# load-nvmrc() {
#   if [[ -f .nvmrc && -r .nvmrc ]]; then
#     nvm use
#   elif [[ $(nvm version) != $(nvm version default)  ]]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
#
# cd() { builtin cd "$@"; 'load-nvmrc'; }
