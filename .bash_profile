export PROGRAMS_HOME=/home/dandimitrov/Programs # user install programs folder
export JDK_HOME=/usr/lib64/jvm/java-8-openjdk/
export JAVA_HOME=$JDK_HOME

export INTELLIJ_HOME=$PROGRAMS_HOME/idea-IU/bin
export MONGOCHEF_HOME=$PROGRAMS_HOME/mongochef/bin
export GEM_HOME="/home/danailbd/.gem/ruby/2.2.0/bin"
export MONGO_HOME="/home/danailbd/Programs/mongodb/mongodb-linux-i686-3.2.3/bin"

export PATH=$PATH:$JAVA_HOME:$GEM_HOME:$MONGO_HOME:$PROGRAMS_HOME:$INTELLIJ_HOME:$MONGOCHEF_HOME


if [ -f ${HOME}/.aliases.sh ]
then
    source ${HOME}/.aliases.sh
fi
if [ -f '.zsh_scripts' ]
then
    source '.zsh_scripts'
fi
