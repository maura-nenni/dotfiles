#!/bin/bash

CONFIGFOLDER := ${HOME}/.config

# starship config
cp ${CONFIGFOLDER}/starship.toml config/

# tmux config
cp ~/.tmux.conf .

# nvim config
cp ${CONFIGFOLDER}/nvim/*.vim config/nvim/
