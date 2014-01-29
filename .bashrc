############################################

# Modified from emilis bash prompt script

# from https://github.com/emilis/emilis-config/blob/master/.bash_ps1

#

# Modified for Mac OS X by

# @corndogcomputerte

###########################################/Users/ken/.bash_profile
# Fill with minuses

# (this is recalculated every time the prompt is shown in function prompt_command):

fill="--- "


reset_style='\[\033[00m\]'

#status_style=$reset_style'\[\033[0;37m\]' # gray color; use 0;37m for lighter color
#prompt_style=$reset_style
#command_style=$reset_style'\[\033[1;29m\]' # bold black

status_style=$reset_style'\[\033[0;20m\]' # gray color; use 0;37m for lighter color

prompt_style=$reset_style'\[\033[0;90m\]'

command_style=$reset_style'\[\033[1;29m\]' # bold black

# Prompt variable:

#PS1="$status_style"'$fill \t\n'"$prompt_style"'${debian_chroot:+($debian_chroot)}\u@\h:\w\$'"$command_style "
PS1='$fill \t\n'"\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

# Reset color for command output

# (this one is invoked every time before a command is executed):

trap 'echo -ne "\033[00m"' DEBUG


function prompt_command {


# create a $fill of all screen width minus the time string and a space:

let fillsize=${COLUMNS}-9

fill=""

while [ "$fillsize" -gt "0" ]

do

fill="-${fill}" # fill with underscores to work on

let fillsize=${fillsize}-1

done


# If this is an xterm set the title to user@host:dir

case "$TERM" in

xterm*|rxvt*)

bname=`basename "${PWD/$HOME/~}"`

echo -ne "\033]0;${bname}: ${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"

;;

*)

;;

esac


}

PROMPT_COMMAND=prompt_command

#Command Aliases
alias c='clear'
#ls modifier
alias ls='ls -alvGFh'
#list dir as tree
alias lr='ls -RG | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''

alias dirr='ls'

#change directory and list contents
function cdd()
{
	if [ "$*"=""]
		then
		cd
		else
			cd "$*";
	fi
	dirr;
}
#'spy' returns list of open internet sockets, 
#optionally filter (via grep) for host/process/user/etc by adding an argument. 
#Use '-n' before the pipe to disable dns resolution, 
#or use your favorite incantation of 'lsof'.
function spy () { lsof -i -P +c 0 +M | grep -i "$1"; }

#find open ports
function findTCP() {
    (netstat  -atn | awk '{printf "%s\n%s\n", $4, $4}' | grep -oE '[0-9]*$'; seq 32768 61000) | sort -n | uniq -u | head -n 1
}
#pythin simple server from directory to port 24
function servedir() {
    sudo python -m SimpleHTTPServer 24
}
#Active Network Listeners
alias netl='lsof -i -P | grep LISTEN'
#show hidden files
alias show='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
#hide hidden files
alias hide='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
#alias mysql='/usr/local/mysql/bin/mysql'
#alias mysqladmin='/usr/local/mysql/bin/mysqladmin'
alias cf='/Applications/ColdFusion10/cfusion/bin/coldfusion'
alias github='https://github.com/KenNewton/atom-labs'


#Directory Aliases
alias ..='cd ..; ls'
alias ...='cd ../../; ls'
alias ....='cd ../../../; ls'
alias .....='cd ../../../../; ls'
alias ......='cd ../../../../../; ls'
alias ht='cd /Applications/MAMP/htdocs;ls'
alias atom-edit='cd /Applications/MAMP/htdocs/plphp;ls'
alias lyn='cd /Applications/MAMP/htdocs/lynda'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

. /usr/local/Cellar/z/1.8/etc/profile.d/z.sh
