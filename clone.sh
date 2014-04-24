#!/bin/sh

# create new erlang project based on this template

PROJ_NAME=$1
if [ -z $PROJ_NAME ]; then
    echo "usage: ./clone.sh PROJ_NAME [DESTINATION]"
    exit 0
fi

DESTINATION=$2
if [ -z $DESTINATION ]; then
    DESTINATION=~/p
fi

DIR=$DESTINATION/$PROJ_NAME

echo "Clonning to $DIR"
mkdir -p $DIR
cp -r ./* $DIR
cp .gitignore $DIR

cd $DIR
rm clone.sh
echo "# $PROJ_NAME\n\nproject description here" > README.md

sed s:"some":"${PROJ_NAME}": some.config > ${PROJ_NAME}.config
rm some.config

sed s:"-config some":"-config ${PROJ_NAME}": Makefile > Makefile.tmp
sed s:"-s some_app start":"-s ${PROJ_NAME}_app start": Makefile.tmp > Makefile
rm Makefile.tmp

cd src
sed s:"{application, some":"{application, $PROJ_NAME": some.app.src > some.app.src.tmp
sed s:"{mod, {some":"{mod, {$PROJ_NAME": some.app.src.tmp > ${PROJ_NAME}.app.src
rm some.app.src some.app.src.tmp

sed s:"-module(some":"-module($PROJ_NAME": some_app.erl > some_app.erl.tmp
sed s:"application\:start(some)":"application\:start($PROJ_NAME)": \
some_app.erl.tmp > some_app.erl
sed s:"some_sup\:start_link":"${PROJ_NAME}_sup\:start_link": \
some_app.erl > ${PROJ_NAME}_app.erl
rm some_app.erl some_app.erl.tmp

sed s:"-module(some":"-module($PROJ_NAME": some_sup.erl >  ${PROJ_NAME}_sup.erl
rm some_sup.erl

exit 0
