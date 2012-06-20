# Tell ls to be colourful
export CLICOLOR=1
#export LSCOLORS=Exfxcxdxbxegedabagacad

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

function mukd() {
    cd /var/www/mukuru
}

if [ -f ~/.git_prompt/.bash_prompt ]; then
    . ~/.git_prompt/.bash_prompt;
fi

MYSQL_USER="root"
MYSQL_PASSWORD=""

function my_restore() {
    echo $1;
    (
        echo "SET AUTOCOMMIT=0;"
        echo "SET UNIQUE_CHECKS=0;"
        echo "SET FOREIGN_KEY_CHECKS=0;"
        cat "$2"
        echo "SET FOREIGN_KEY_CHECKS=1;"
        echo "SET UNIQUE_CHECKS=1;"
        echo "SET AUTOCOMMIT=1;"
        echo "COMMIT;"
    ) | mysql -u"$MYSQL_USER" "$1" -f
}

function mkmk() {
	[ $1 ] || echo 'usage: mkmk filename' && return;
    dir="`dirname $1`";
    [ $dir ] && mkdir -p $dir;
    touch $1;
}
			
# dedupe history, keep more and always append history 
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend
