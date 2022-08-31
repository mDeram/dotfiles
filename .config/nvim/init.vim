call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'mbbill/undotree'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'

" Plug 'prettier/vim-prettier'

call plug#end()

colorscheme gruvbox
" highlight Normal guibg=none

let mapleader = " "

lua require("telescope_config")
lua require("lsp_config")

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup MATUTU
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" Yes please
vnoremap <leader>p "_dP
nnoremap <leader>u :UndotreeShow<CR>
" ctrl backspace to delete word
inoremap <C-H> <C-W>
