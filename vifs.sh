#!/bin/sh

pattern=$1
includeFiles=$2

delimiter=:

declare -A fileHashmap

fileList=$(
grep -rn $pattern --include=$includeFiles | awk '{ print $1 }' | \
while read line
do
  IFS=':' read -ra ARRAY <<< "$line"
  filePath=${ARRAY[0]}
  if [ "${fileHashmap[$filePath]}" == "1" ];
  then
    continue
  fi
  fileHashmap[$filePath]=1
  echo $filePath
done
)

vim $fileList +"/$pattern"
