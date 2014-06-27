#!/bin/sh

dir='node_modules/coffeescript-style-guide'
coffeelint=$dir'/node_modules/.bin/coffeelint'

if [ $# -ne 0 ]; then
  for arg in $*; do
    $coffeelint -f $dir/coffeelint-config.json $arg
  done
else
  if [ -d ".git" ]; then
    git ls-files | grep -E .coffee$ | xargs $coffeelint -f $dir/coffeelint-config.json
  else
    find . -type f -path "*.coffee" | grep -v node_modules | xargs $coffeelint -f $dir/coffeelint-config.json
  fi
fi
