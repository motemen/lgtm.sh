# lgtm.sh

The fastest way to generate animated LGTM images

## Installation

With [homebrew](http://brew.sh/) do:

    % brew tap motemen/motemen
    % brew install lgtm.sh

With [bpkg](https://github.com/bpkg/bpkg) do:

    % bpkg install motemen/lgtm.sh

## Usage

    % lgtm.sh [-m] [-c]

 * `-m` :: Output in Markdown (without `-m`, outputs only image URL)
 * `-c` :: Send to clipboard

## Example

    % lgtm.sh -m
    [![LGTM](http://lgtm.herokuapp.com/http://38.media.tumblr.com/f1042f48459acd3b1e7c568c0faa7eec/tumblr_n8o30zwsJx1tfp3xbo1_500.gif)](http://lgtm.herokuapp.com/)

[![LGTM](http://lgtm.herokuapp.com/http://38.media.tumblr.com/f1042f48459acd3b1e7c568c0faa7eec/tumblr_n8o30zwsJx1tfp3xbo1_500.gif)](http://lgtm.herokuapp.com/)

## Customization

Place a file at `~/.config/lgtm.sh/sources`, which should have one URL per one line like:

    http://foo.tumblr.com/
    http://bar.tumblr.com/

Feel free to add your favorite source to [Wiki](https://github.com/motemen/lgtm.sh/wiki/GIF-Sources)!

## Requirements

[pup](https://github.com/EricChiang/pup)

## Author

motemen <motemen@gmail.com>
