#!/bin/bash

configfolder=${HOME}/.config
echo "--- copy from ${configfolder}"

# starship config
cp ${configfolder}/starship.toml config/

# tmux config
cp ~/.tmux.conf .

# nvim config
cp ${configfolder}/nvim/*.vim config/nvim/

echo "--- copy done"
