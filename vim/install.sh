#!/bin/sh
vim +PluginInstall! +qall >/tmp/vim-$USER-plugins.log 2>&1 || true
