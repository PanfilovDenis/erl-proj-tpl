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
rm $DIR/clone.sh
mv $DIR/src/some_app.erl $DIR/src/${PROJ_NAME}_app.erl
mv $DIR/src/some.app.src $DIR/src/${PROJ_NAME}.app.src
echo "# $PROJ_NAME\n\nproject description here" > $DIR/README.md


echo "DONE"
exit 0