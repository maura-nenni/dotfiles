#!/bin/bash

echo "--- INSTALLATION MAURA NENNI CONFIG"

CONFIGFOLDER := ${HOME}/.config

# installation des paquets de base 
sudo apt update
sudo apt upgrade -y
sudo apt install gcc make perl tmux wget curl bzip2 unzip build-essential python3 -y

# copy bashrc
cp .bashrc ${HOME}/

# install a nerd-font
mkdir ${HOME}/.fonts
font=FiraCode
zip_file="${font}.zip"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/${zip_file}
unzip "$zip_file" -d "${HOME}/.fonts" -x "*.txt/*" -x "*.md/*"
rm ${zip_file}

# miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
bash  miniconda.sh -b -p /opt/miniconda 
export PATH="/opt/miniconda/bin:$PATH"
conda init
echo "conda deactivate" >> ${HOME}/.bashrc
conda clean -y --all && rm -f /opt/miniconda.sh
apt autoremove --purge && apt clean
conda install -y mamba -c conda-forge

# install/config tmux
echo "--- TMUX "
cp .tmux.conf ${HOME}/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ${HOME}/.tmux.conf

## install nvim & config
echo "--- NVIM "
# install
curl -C -O https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage && ./nvim.appimage
rm nvim.appimage
# config with vim-plug
sh -c 'curl -fLo ${CONFIGFOLDER}/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cp .config/nvim/*.vim ${CONFIGFOLDER}/nvim/
mkdir ${CONFIGFOLDER}/nvim/plugged

# starship
echo "--- STARSHIP "
curl -sS https://starship.rs/install.sh
chmod +x install.sh && ./install.sh && rm install.sh
cp .config/starship.toml ${CONFIGFOLDER}/
echo "eval \"$(starship init bash)\"" >> ${HOME}/.bashrc


echo "--- INSTALL DONE "

