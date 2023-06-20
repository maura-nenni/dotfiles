" LISTE DES PLUGGINS "

call plug#begin('~/.config/nvim/plugged')
"Plug 'neoclide/coc.nvim', {'branch': 'release'}     " code completion engine Intellisense"
"Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'} " file explorer"
Plug 'kyazdani42/nvim-web-devicons'                 " icones de nerd-fonts"
Plug 'norcalli/nvim-colorizer.lua'                  " highlighter"
Plug 'akinsho/bufferline.nvim', { 'tag': '*'}       " bar de buffer (avec devicons)"
Plug 'glepnir/dashboard-nvim'                       " startup page"
Plug 'Famiu/feline.nvim'                            " status bar"
Plug 'lukas-reineke/indent-blankline.nvim'          " guide indendation automatique"
Plug 'nvim-lua/plenary.nvim'                        " tools pour les plugins"
Plug 'nvim-telescope/telescope.nvim'                " fuzzy finder"
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'iamcco/markdown-preview.nvim'
Plug 'mzlogin/vim-markdown-toc'
Plug 'renerocksai/telekasten.nvim'
Plug 'renerocksai/calendar-vim'

" thèmes "
Plug 'Mofiqul/dracula.nvim'                
Plug 'sainnhe/gruvbox-material'
Plug 'shaunsingh/nord.nvim'
call plug#end()

