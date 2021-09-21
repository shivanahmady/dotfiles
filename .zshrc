#/bin/zsh
echo "\n \U10455"
echo "============================" 
echo " bcwipe --> Secure Erase"
echo " gpg -> Encrypt"
echo " pip = python3 -m pip"
echo "============================ \n" 



### SHELL CONFIG
#########################################################
PROMPT='%F{208}%n%f in %F{226}%~%f -> '

setopt NO_CASE_GLOB
setopt SHARE_HISTORY	# SHARE HISTORY ACROSS SESSIONS
setopt APPEND_HISTORY	# APPEND HISTORY
setopt HIST_IGNORE_DUPS 	# DO NOT STORE DUPLICATES




### EXPORTS + PATHS
#########################################################
export PATH="$HOME/bin:$PATH";	# Add `~/bin` to `$PATH`
export GUILE_TLS_CERTIFICATE_DIRECTORY=/usr/local/etc/gnutls/

#### The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sa/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/sa/google-cloud-sdk/path.zsh.inc'; fi

#### The next line enables shell command completion for gcloud.
if [ -f '/Users/sa/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/sa/google-cloud-sdk/completion.zsh.inc'; fi




### NAVIGATION + BASIC COMMANDS
#########################################################
alias path='echo -e ${PATH//:/\\n}'	# PRINT PATH LINE BY LINE
alias reload='source ~/.zshrc'

alias ..="cd .."
alias ...="cd ../.."

colorflag="-G"
export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
alias ll='ls -la'
alias l="ls -lF ${colorflag}"
alias la="ls -lAF ${colorflag}"
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"
alias ls="command ls ${colorflag}"

alias rm="safe-rm"
alias rf="safe-rm -rf"

alias pip='python3 -m pip'

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

### CUSTOM COMMANDS
#########################################################
### Show/Hide Hidden Files
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

### URL-Encode Strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'



### SYSTEM
########################
### Updates
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'

### Zombie Node Processes
alias psnod='ps aux | grep "node dist" | grep -v "grep"'

### Processes By Port
alias psport='lsof -nP -i4TCP | grep LISTEN'



### IP / NETWORK
######################## 
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"



### CLEAN
########################
### Remove `.DS_Store` recursively
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

### Flush Dir Service Cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

### Clean LaunchServices 
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"\

