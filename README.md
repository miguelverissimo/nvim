# Miguel's neovim distribution (alpha)
Nvim configuration with sensible defaults

Main source of inspiration / copy is [Luan's nvim distribution](https://github.com/luan/nvim)
as it was my first contact with a usable and pleasurable vim distro. I highly recommend you
give it a try, as it leverages Luan's deep knowledge of (neo)vim and efficient workflows.

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

## Customizing

In the distribution directory there's `user` directory that's git ignored,
`$XDG_CONFIG_HOME/nvim/user`, it will be created on first start based on the
`user.defaults` on in this repo. The three hooks are:

* `user/before.vim`: Runs before everything, useful to set globals that change
  plugin behavior
* `user/plug.vim`: Runs during plugin setup, you can add your own choices of
  plugins here. More on adding plugins
  [here](https://github.com/junegunn/vim-plug)
* `user/after.vim`: Runs at the end, useful to override and map your own key
  bindings and configure your custom plugins. This is also where you'd change
  the colorscheme

It is recommended that you track your user settings on a separate repo and
symlink them in here, see [my dotfiles
repo](https://github.com/miguelverissimo/dotfiles/tree/master/nvim) for
an example.

### Options

  - `g:autosave`: add a `let g:autosave = 1` to your `user/before.vim` to enable
    autosaving.

## Troubleshooting

In the even things behave incorrectly or the config becomes unstable in general,
regular vim debugging methods apply. Check `:checkhealth` for clues on what's
wrong with your setup.

Make sure language servers are installed for your language;
`:ConfigInstallLanguageServers` installs a few that aren't automatically managed
by other plugins (this should have happened automatically but it is sometimes good
to make sure it runs successfully).

Sometimes plugin authors make backwards incompatible changes or push changes in
ways that confuse [vim-plug](https://github.com/junegunn/vim-plug). A simple way
to reset your plugin installation and start over is to remove them from the
load path in `~/.local/share/nvim/plugged` which can be run with
`:ConfigResetAllPluginsReallyDoIt!`.
