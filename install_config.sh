#!/bin/bash

# Declaration des trucs à installer
MAJ=1
BASHRC=1
NERDFONT=1
font=FiraCode
MAMBA=1
TMUX=1
NVIM=1
STARSHIP=1
HELP="
Si pas d'arguments, installe tout sinon :
-u          update, upgrade et installe les paquets nécessaires
-b          copie le .bashrc
-f          installe une font de nerd-fonts, FiraCode par défaut
-o FONT     précise la font
-c          installe miniconda en local avec mamba
-t          installe tmux avec une configuration
-n          installe neovim et config perso
-s          installe starship
"

while getopts "hubfctnso:" x; do
    case "$x" in
        h)
            printf "%s\\n" "${HELP}"
            exit 2
            ;;
        u)
            BASHRC=0
            NERDFONT=0
            MAMBA=0
            TMUX=0
            NVIM=0
            STARSHIP=0
            ;;
        b)
            MAJ=0
            NERDFONT=0
            MAMBA=0
            TMUX=0
            NVIM=0
            STARSHIP=0
            ;;
        f)
            MAJ=0
            BASHRC=0
            NERDFONT=1
            MAMBA=0
            TMUX=0
            NVIM=0
            STARSHIP=0
            ;;
        
        o)
            MAJ=0
            BASHRC=0
            font="$OPTARG"
            MAMBA=0
            TMUX=0
            NVIM=0
            STARSHIP=0
            ;;
        c)
            MAJ=0
            BASHRC=0
            NERDFONT=0
            TMUX=0
            NVIM=0
            STARSHIP=0
            ;;
        t)
            MAJ=0
            BASHRC=0
            NERDFONT=0
            MAMBA=0
            NVIM=0
            STARSHIP=0
            ;;
        n)
            MAJ=0
            BASHRC=0
            NERDFONT=0
            MAMBA=0
            TMUX=0
            STARSHIP=0
            ;;
        s)
            MAJ=0
            BASHRC=0
            NERDFONT=0
            MAMBA=0
            TMUX=0
            NVIM=0
            ;;
        ?)
            printf "Pas compris arg, essaye -h\\n"
            exit 1
            ;;
    esac
done

printf "===============================\\n"
printf "INSTALLATION MAURA NENNI CONFIG\\n"
printf "===============================\\n\\n"

printf "Changements prevus\\n"
printf "==================\\n\\n"

if [ "$MAJ" = "1" ]; then
    printf "\t * update, upgrade et installation dependances\\n"
fi
if [ "$BASHRC" = "1" ]; then
    printf "\t * copie le .bashrc\\n"
fi
if [ "$NERDFONT" = "1" ]; then
    printf "\t * installe une font de nerd-fonts, FiraCode par défaut\\n"
    printf "\t\t-> la fonte est %s\\n" "${font}"
fi
if [ "$MAMBA" = "1" ]; then
    printf "\t * installe miniconda en user avec mamba\\n"
fi
if [ "$TMUX" = "1" ]; then
    printf "\t * installe une config tmux\\n"
fi
if [ "$NVIM" = "1" ]; then
    printf "\t * installe neovim et config perso\\n"
fi
if [ "$STARSHIP" = "1" ]; then
    printf "\t * installe starship\\n"
fi
printf "\\n"

printf "Execution\\n"
printf "=========\\n\\n"

configfolder=${HOME}/.config

# installation des paquets de base 
if [ "$MAJ" = "1" ]; then
    echo "--- maj system "
    sudo apt update
    sudo apt upgrade -y
    sudo apt install gcc make perl tmux wget curl bzip2 unzip libfuse2 build-essential python3 -y
fi

# copy bashrc
if [ "$BASHRC" = "1" ]; then
    echo "--- BASHRC "
    cp .bashrc ${HOME}/
fi

# install a nerd-font
if [ "$NERDFONT" = "1" ]; then
    echo "--- NERDFONT "
    mkdir ${HOME}/.fonts
    zip_file="${font}.zip"
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/${zip_file}
    unzip "$zip_file" -d "${HOME}/.fonts" -x "*.txt/*" -x "*.md/*"
    rm ${zip_file}
fi

# miniconda
if [ "$MAMBA" = "1" ]; then
    echo "--- MAMBA "
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
    bash  miniconda.sh -b
    conda init
    source ${HOME}/.bashrc
    echo "conda deactivate" >> ${HOME}/.bashrc
    conda clean -y --all && rm -f miniconda.sh
    apt autoremove --purge && apt clean
    conda install -y mamba -c conda-forge
fi

# install/config tmux
if [ "$TMUX" = "1" ]; then
    echo "--- TMUX "
    cp .tmux.conf ${HOME}/
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    tmux source ${HOME}/.tmux.conf
    ${HOME}/.tmux/plugins/tpm/scripts/install_plugins.sh # same as prefix + I
    sed -i -e 's/@catppuccin_date_time\" \"off\"/@catppuccin_date_time\" \"%d-%m-%Y %H\:%M\"/' ${HOME}/.tmux/plugins/catppuccin-tmux/catppuccin.tmux
fi

## install nvim & NvChad + custom config
if [ "$NVIM" = "1" ]; then
    echo "--- NVIM "
    # install neovim
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    sudo mv nvim.appimage /usr/local/bin/nvim

    # installation de NvChad
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
    nvim
    
    # pas de config example
    # theme : <spc>+th 
    # :TSInstall bash, :TSInstall python

fi

# starship
if [ "$STARSHIP" = "1" ]; then
    echo "--- STARSHIP "
    curl -sS https://starship.rs/install.sh | sh
    cp config/starship.toml ${configfolder}/
    echo "eval \"\$(starship init bash)\"" >> ${HOME}/.bashrc
fi

printf "\\n \t \t \t INSTALL DONE\\n"

