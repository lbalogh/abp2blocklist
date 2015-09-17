#!/bin/sh

curl -o easylist.txt https://easylist-downloads.adblockplus.org/easylist.txt

remote_version=`cat easylist.txt | grep "! Version:" | awk '{print $3}'`

if [ -f easylist_version.txt ]
then
  local_version=`cat easylist_version.txt`
else
  local_version="0"
fi

if [ "$local_version" != "$remote_version" ]
then
  echo $remote_version > easylist_version.txt

  node abp2blocklist.js < easylist.txt > easylist.json

  git add easylist.json
  git commit -m "Update easyList `date`"
  git push origin compatible
fi

rm -rf easylist.txt

