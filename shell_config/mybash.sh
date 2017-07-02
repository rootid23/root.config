
if [ -z ${VI_CONF} ]
then
  echo "NOTE : set VI_CONF env var in the direnv"
  exit 1
fi

source ${VI_CONF}/bash_addons/default.shrc
source ${VI_CONF}/bash_addons/git.shrc
source ${VI_CONF}/bash_addons/search.shrc
source ${VI_CONF}/bash_addons/ack.shrc

#NOTE source this in your ~/.bashrc
# vim: ts=2 sts=2 sw=2 et nospell : 
