#!/bin/sh

pattern="$1"
includeFiles="$2"

[ -z "$pattern" ] && echo "usage: vifs <search regexp> <include file regex (optional)>" && exit 1

delimiter=:

mainArgs="'$pattern'"

[ ! -z "$includeFiles" ] && mainArgs="$mainArgs --include=$includeFiles"

echo $mainArgs

declare -A fileHashmap

fileList=$(
echo $mainArgs | xargs grep -rn | awk '{ print $1 }' | \
while read line
do
  IFS=':' read -ra ARRAY <<< "$line"
  filePath=${ARRAY[0]}
  [ "${fileHashmap[$filePath]}" == "1" ] && continue
  fileHashmap[$filePath]=1
  echo $filePath
done
)

vim $fileList +/"$pattern"
