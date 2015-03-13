#!/bin/bash

sites=(
    http://publicdomaingifs.tumblr.com/
)

cachefile="$0.cache"

usage() {
    cat <<EOD
usage: $0 [-m]
EOD
}

lgtm_markdown() {
    echo "[![LGTM]($(lgtm))](http://lgtm.herokuapp.com/)"
}

lgtm() {
    if [ -s $cachefile ]; then
        cat $cachefile
        ( lgtm_nocache > $cachefile ) &
    else
        ( lgtm_nocache > $cachefile ) & lgtm_nocache
    fi
}

lgtm_nocache() {
    site=${sites[$(($RANDOM % ${#sites[@]}))]}
    echo 'http://lgtm.herokuapp.com/'$(curl -sL ${site}random | pup 'meta[name=twitter:image]' 'attr{content}')
}

case "$1" in
    -m)
        lgtm_markdown
        ;;
    '')
        lgtm
        ;;
    *)
        usage
        ;;
esac
