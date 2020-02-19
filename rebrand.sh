#!/bin/bash

dir=$1


function moveFiles {
  files=`find $dir -name "*jqx*"`
  for file in $files
  do
    echo $file
    newfile=${file//jqx/jqu}
    dirname=`dirname $newfile`
    `mkdir -p $dirname`
    mv -f $file $newfile
    echo $newfile
  done
}
function changeFiles {
  files=`find $dir -name "*jqu*" -type f`
  for newfile in $files
  do
    echo $newfile
    perl -p -i -e "s?jQWidgets?jqui?g" $newfile
    perl -p -i -e "s?jqwidgets?jqui?g" $newfile
    perl -p -i -e "s?jqx?jqu?g" $newfile
  done
}

#moveFiles
changeFiles
