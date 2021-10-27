" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

" Aesthetics
Plug 'lokesh-krishna/moonfly.nvim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'shaunsingh/nord.nvim'
Plug 'overcache/NeoSolarized'
Plug 'folke/lsp-colors.nvim'

" Status bar
" Plug 'famiu/feline.nvim'
Plug 'hoob3rt/lualine.nvim'

" Bufferline
Plug 'akinsho/bufferline.nvim'

" Syntax Highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Diagnostics
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'

" For autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

" For luasnip user.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Icon Support
Plug 'kyazdani42/nvim-web-devicons'

" Telescope Fuzzy Finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Auto Complete Brackets
Plug 'windwp/nvim-autopairs'

" Cmake integration
Plug 'cdelledonne/vim-cmake'

" emmet
Plug 'mattn/emmet-vim'

call plug#end()

