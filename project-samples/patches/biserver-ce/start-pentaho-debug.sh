#!/bin/sh
### ====================================================================== ###
##                                                                          ##
##  Pentaho Start Script                                                    ##
##                                                                          ##
### ====================================================================== ###

DIR_REL=`dirname $0`
cd $DIR_REL
DIR=`pwd`
cd -

. "$DIR/set-pentaho-env.sh"

setPentahoEnv "$DIR/jre"

if [ -e "$DIR/promptuser.sh" ]; then
  sh "$DIR/promptuser.sh"
  rm "$DIR/promptuser.sh"
fi
if [ "$?" = 0 ]; then
  cd "$DIR/tomcat/bin"
  export CATALINA_OPTS="@JAVA_OPTS_DEBUG@"
  JAVA_HOME=$_PENTAHO_JAVA_HOME
  sh startup.sh
fi
