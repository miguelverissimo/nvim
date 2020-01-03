# Miguel's neovim distribution (alpha)
Nvim configuration with sensible defaults

Main source of inspiration / copy is [Luan's nvim distribution](https://github.com/luan/nvim) as it was my first contact with a usable and pleasurable vim distro. I highly recommend you give it a try, as it leverages Luan's deep knowledge of (neo)vim and efficient workflows.

## Installation

This config works exclusively on [Neovim](https://neovim.io), so you'll need to [install
it](https://github.com/neovim/neovim/wiki/Installing-Neovim) on your system
first. You also need python and the [python 3 client for
Neovim](https://github.com/neovim/python-client) installed(python 3 is
vital).

** Auto-update Dependencies**:

  * [`curl`](https://curl.haxx.se/): used to install the plugin manager.
  * [`npm`](https://www.npmjs.com/): used to install JS tools and some language
    server binaries.
  * [`yarn`](https://yarnpkg.com/en/): used to install
    [`coc.nvim`](https://github.com/neoclide/coc.nvim) extensions for better and
    fancier autocomplete and language features.

Once you have that setup, all you have to do is clone this config in the right
spot:

```bash
git clone https://github.com/miguelverissimo/nvim ~/.config/nvim
```

Plugins will be automatically downloaded and setup as necessary.

## Updating

The distribution checks for updates on boot and every hour when it's running.
The check is non-disruptive and will only show messages passively when one of
the following is true:

* An update is available (and you should run `:ConfigUpdate` or
  `:ConfigUpdate!`).
* An error occurred fetching the remove version.
* You have local changes on your nvim config repo (you really shouldn't unless
  you're preparing a PR).

`:ConfigUpdate` updates the local config and you can also `:ConfigUpdate!` to
update *and* force run the post-update hooks.
