#!/bin/sh

pattern=$1
includeFiles=$2

[ -z $pattern ] && echo "usage: vifs <search regexp> <include file regex (optional)>" && exit 1

delimiter=:
mainCommand="grep -rn $pattern"

[ ! -z $includeFiles ] && mainCommand="$mainCommand --include=$includeFiles"

declare -A fileHashmap

fileList=$(
$mainCommand | awk '{ print $1 }' | \
while read line
do
  IFS=':' read -ra ARRAY <<< "$line"
  filePath=${ARRAY[0]}
  [ "${fileHashmap[$filePath]}" == "1" ] && continue
  fileHashmap[$filePath]=1
  echo $filePath
done
)

vim $fileList +"/$pattern"
