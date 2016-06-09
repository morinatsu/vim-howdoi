# vim-howdoi

A Vim frontend for [howdoi][1], the awesome command line tool that lets you ask what you need and grabs the snippet of code from SO.

<img src="https://raw.github.com/laurentgoudet/vim-howdoi/master/vim-howdoi.gif"/>

# Features

  * Type your query and enter `<CTRL-H>` to get the code!
  * You can also use the plugin's menu entry under GUI
  * Overwrite the default mapping with `map <WhatYouWant> <Plug>Howdoi`

# Requirements

Install [howdoi][1] if you haven't:

```bash
pip install howdoi
```

# Installation

## Pathogen

Clone this repository in your `~/.vim/bundle` directory:

```bash
git clone https://github.com/laurentgoudet/vim-howdoi.git
```

## Using vundle

Add this to your `~/.vimrc` file:

```vim
Bundle 'laurentgoudet/vim-howdoi.git'
```

Then, from the command line, run:

```bash
vim +BundleInstall +qall
```

## Manually

Clone the plugin into a seperate directory:

```bash
cd ~/.vim
git clone https://github.com/laurentgoudet/vim-howdoi.git bundle/vim-howdoi
```

Add to your `~/.vimrc`:

```
set runtimepath^=~/.vim/bundle/vim-howdoi
```

# Usage

1. Write what your are looking for
2. Press `<CTRL-H>` to get the code!

# Troubleshooting

You'll maybe need LXML2 `apt-get install python-lxml` if [howdoi][1] compilation fails.

# License

This plugin is released under the [WTFPLv2 License][2].

[1]: https://github.com/gleitz/howdoi
[2]: http://www.wtfpl.net/txt/copying/

