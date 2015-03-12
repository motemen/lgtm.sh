#!/bin/bash

sites=(
    http://gif-chan.tumblr.com/
    http://kawaiianimegif.tumblr.com/
)

cachefile="$0.cache"

lgtm() {
    site=${sites[$(($RANDOM % ${#sites[@]}))]}
    echo '[![LGTM](http://lgtm.herokuapp.com/'$(curl -sL ${site}random | pup 'meta[name=twitter:image]' 'attr{content}' | sed 's#/#%2F#g')')](http://lgtm.herokuapp.com/)'
}

if [ -s $cachefile ]; then
    cat $cachefile
    ( lgtm > $cachefile ) &
else
    ( lgtm > $cachefile ) & lgtm
fi
