dir='node_modules/coffeescript-style-guide'
coffeelint=$dir'/node_modules/.bin/coffeelint'

find . -type f -path "*.coffee" | grep -v node_modules | xargs $coffeelint -f $dir/coffeelint-config.json
