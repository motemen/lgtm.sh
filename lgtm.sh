#!/bin/bash

sites=(
    http://publicdomaingifs.tumblr.com/
)

cachefile="$0.cache"

usage() {
    cat <<EOD
usage: $0 [-c] [-m]
EOD
    exit 1
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
    site=${sites[$(($RANDOM % ${#sites[@]}))]}
    local id=$(curl -sL ${site}random | pup 'meta[name=twitter:image]' 'attr{content}')
    echo "http://lgtm.herokuapp.com/$id"
}

cache() {
    ( lgtm_nocache > $cachefile ) &
}

main() {
    lgtm=lgtm
    pipe=cat

    while [[ $# > 0 ]]; do
        case "$1" in
            -c)
                pipe=pbcopy
                ;;
            -m)
                lgtm=lgtm_markdown
                ;;
            *)
                usage
                ;;
        esac

        shift
    done

    eval "$lgtm | $pipe"
}

main $*
cache
