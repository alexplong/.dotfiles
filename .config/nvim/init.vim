:set number
:set autoindent
:set tabstop=2
:set shiftwidth=2
:set smarttab
:set softtabstop=2
:set mouse=a

call plug#begin()
	Plug 'tpope/vim-surround'
	Plug 'preservim/nerdtree'
	Plug 'preservim/tagbar'
	Plug 'vim-airline/vim-airline'
  Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', {'tag' : '0.1.8' }
	Plug 'nvim-treesitter/nvim-treesitter', { 'do' : ':TSUpdate' }
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'ryanoasis/vim-devicons'
	Plug 'rafi/awesome-vim-colorschemes'
	Plug 'chriskempson/base16-vim'
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'tpope/vim-fugitive'

call plug#end()

" Map key chord `jk` to <Esc>.
let g:esc_j_lasttime = 0
let g:esc_k_lasttime = 0
function! JKescape(key)
	if a:key=='j' | let g:esc_j_lasttime = reltimefloat(reltime()) | endif
	if a:key=='k' | let g:esc_k_lasttime = reltimefloat(reltime()) | endif
	let l:timediff = abs(g:esc_j_lasttime - g:esc_k_lasttime)
	return (l:timediff <= 0.05 && l:timediff >=0.001) ? "\b\e" : a:key
endfunction
inoremap <expr> j JKescape('j')
inoremap <expr> k JKescape('k')" Dev-Icons Setup

set encoding=utf8
set guifont=JetBrainsMonoNL\	Nerd\ Font\ 11	" Set Vim font to a Nerd Font

let g:airline_powerline_fonts = 1							" Needed for vim-airline
let g:airline#extensions#branch#enabled = 1		" Show Git Branch vim-airline
let g:airline#extensions#tabline#enabled = 1	" Display all buffers when only one tab open

" Set Theme<F10>
:colorscheme base16-onedark

" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Saving a new file after creating a buffer from within Vim
cmap w!! %!sudo tee > /dev/null

" This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

" TreeSitter- at the bottom of your init.vim, keep all configs on one line
lua require 'nvim-treesitter.configs'.setup{ensure_installed={"c","lua","vim","vimdoc","query"},auto_install=true,highlight={enable=true}} 
