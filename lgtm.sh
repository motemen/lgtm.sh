#!/bin/bash

sourcesfile=~/.config/lgtm.sh/sources
if [ -e "$sourcesfile" ]; then
    sites=($(cat "$sourcesfile"))
else
    # You can edit this directly, or place a lines of Tumblrs at ~/.config/lgtm.sh/sources.
    sites=(
        http://publicdomaingifs.tumblr.com/
    )
fi

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

get_clipboard() {
    if type pbcopy &>/dev/null; then
        # For OS X
        echo "pbcopy"
    elif type xsel &>/dev/null; then
        # For GNU/Linux
        # xsel supports multibyte chars
        echo "xsel --input --clipboard"
    elif type xclip &>/dev/null; then
        # For GNU/Linux
        echo "xclip -selection clipboard"
    fi
}

main() {
    local pipe lgtm

    while [[ $# > 0 ]]; do
        case "$1" in
            -c)
                pipe="$(get_clipboard)"
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

    eval "${lgtm:-lgtm} | ${pipe:-cat}"
}

main $*
cache
