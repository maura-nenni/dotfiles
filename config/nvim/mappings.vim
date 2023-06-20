" MAPPINGS "

" set la touche leader global
let mapleader = ";"

" edit config
nnoremap <leader>ev :vsplit $MYVIMRC<cr><c-w>r :vertical resize 90<cr>
nnoremap <leader>em :vsplit ~/.config/nvim/mappings.vim<cr><c-w>r :vertical resize 90<cr>
nnoremap <leader>eo :vsplit ~/.config/nvim/options.vim<cr><c-w>r :vertical resize 90<cr>
nnoremap <leader>ep :vsplit ~/.config/nvim/pluggins.vim<cr><c-w>r :vertical resize 90<cr>
nnoremap <leader>epo :vsplit ~/.config/nvim/pluggins_options.vim<cr><c-w>r :vertical resize 90<cr>

" save and refresh config
nnoremap <leader>sv ZZ:source $MYVIMRC<cr>

" insert to normal mode
inoremap jk <esc>

" met un mot entre guillemets
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" pour se forcer à utiliser jk en insert mode "
inoremap <esc> <nop> 

" changement de split "
nnoremap <leader><tab> <c-w>w

" split et vsplit
nnoremap <leader>hs :split<cr>
nnoremap <leader>vs :vsplit<cr>

" raccourci de write et save
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

" gestion des buffers
nnoremap <F2> :bp<cr>
nnoremap <F3> :bn<cr>
nnoremap <F1> :br<cr>
nnoremap <F4> :bl<cr>

" affiche l'heure
nnoremap <F12> :echo strftime("%c") <cr>
inoremap <F12> :echo strftime("%c") <cr>
