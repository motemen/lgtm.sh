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
    else
        lgtm_nocache
    fi
}

lgtm_nocache() {
  echo $(fetch)
}

fetch() {
    site=${sites[$(($RANDOM % ${#sites[@]}))]}
    local id=$(curl -sL ${site}random | pup 'meta[name=twitter:image]' 'attr{content}')
    echo "http://lgtm.herokuapp.com/$id"
}

cache() {
  (
    local url=$(lgtm_nocache)
    echo "$url" > $cachefile
  ) &
}

main() {
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
}

main $1
cache
