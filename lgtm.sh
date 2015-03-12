#!/bin/bash

sites=(
    http://publicdomaingifs.tumblr.com/
)

cachefile="$0.cache"

lgtm() {
    site=${sites[$(($RANDOM % ${#sites[@]}))]}
    echo '[![LGTM](http://lgtm.herokuapp.com/'$(curl -sL ${site}random | pup 'meta[name=twitter:image]' 'attr{content}')')](http://lgtm.herokuapp.com/)'
}

if [ -s $cachefile ]; then
    cat $cachefile
    ( lgtm > $cachefile ) &
else
    ( lgtm > $cachefile ) & lgtm
fi
