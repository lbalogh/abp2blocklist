#!/bin/sh

curl -o easylist.txt https://easylist-downloads.adblockplus.org/easylist.txt
node abp2blocklist.js < easylist.txt > easylist.json
rm -rf easylist.txt
