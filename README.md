# lgtm.sh

The fastest way to generate animated LGTM images

## Installation

With [homebrew](http://brew.sh/) do:

    % brew tap motemen/motemen
    % brew install lgtm.sh

With [bpkg](https://github.com/bpkg/bpkg) do:

    % bpkg install motemen/lgtm.sh

## Usage

    % lgtm.sh -m
    [![LGTM](http://lgtm.herokuapp.com/http://38.media.tumblr.com/f1042f48459acd3b1e7c568c0faa7eec/tumblr_n8o30zwsJx1tfp3xbo1_500.gif)](http://lgtm.herokuapp.com/)

[![LGTM](http://lgtm.herokuapp.com/http://38.media.tumblr.com/f1042f48459acd3b1e7c568c0faa7eec/tumblr_n8o30zwsJx1tfp3xbo1_500.gif)](http://lgtm.herokuapp.com/)

Without `-m` option, it prints only the image URL.

## Customization

Edit [sites](https://github.com/motemen/lgtm.sh/blob/master/lgtm.sh#L3-5) of lgtm.sh
to your favorite animated GIF Tumblr blogs.

    sites=(
      http://foo.tumblr.com/
      http://bar.tumblr.com/
    )

## Requirements

[pup](https://github.com/EricChiang/pup)

## Author

motemen <motemen@gmail.com>
