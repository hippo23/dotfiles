source $HOME/.config/nvim/vim-plug/plugins.vim

set termguicolors
set cursorline
set background=dark
set shell=fish

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Navigation of BUffers
nnoremap <TAB> <cmd>bnext<cr>

" Line Numbers
set number relativenumber

" Tab Size
set tabstop=4
set shiftwidth=4

" Terminal Modifications
autocmd TermOpen * setlocal nonumber norelativenumber nocursorline

" Lsp saga keybindings
nnoremap <silent> <C-j> <Cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> K <Cmd>Lspsaga hover_doc<CR>
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent> ca <cmd>lua vim.lsp.buf.code_action()<CR>

" Mapping commands for cmake
nmap <leader>cg :CMakeGenerate<cr>
nmap <leader>cb :CMakeBuild<cr>
nmap <leader>gt :GTestRunUnderCursor<cr>

let g:cmake_link_compile_commands = 1

if exists("&termguicolors") && exists("&winblend")
	syntax enable
	set termguicolors
	set winblend=0
	set wildoptions=pum
	set pumblend=5
	set background=dark
	" Use NeoSolarized
	let g:neosolarized_termtrans=1
	runtime ./autoload/plugged/NeoSolarized/colors/NeoSolarized.vim
	colorscheme NeoSolarized
endif

lua <<EOF

	-- Lsp
	require'lspconfig'.pyright.setup{
		capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	}

	require'lspconfig'.ccls.setup{
		capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	}

	require'lspconfig'.html.setup{
		capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	}

	require'lspconfig'.tsserver.setup{
		capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	}

	-- Lsp Saga
	local saga = require 'lspsaga'

	--- code action

	saga.init_lsp_saga {
		code_action_icon = '',

		code_action_prompt = {
		  enable = false,
		  sign = true,
		  sign_priority = 20,
		  virtual_text = true,
		},

		error_sign = '',
		warn_sign = '',
		hint_sign = '',
		infor_sign = '',
		border_style = 'round',
		}
	
	-- Lsp colorscheme
	require("lsp-colors").setup({
		Error = "#db4b4b",
		Warning = "#e0af68",
		Information = "#0db9d7",
		Hint = "#10B981"
	})

	-- Status bar
	require('lualine').setup{
		options = {theme = 'solarized_dark'}
	}

	-- auto pair brackets
	require('nvim-autopairs').setup{}

	--bufferline
	-- require("bufferline").setup{
	-- highlights = {
	-- 	fill = {
	-- 		guibg = '#162328',
	-- 		},
	-- 	background = {
	-- 		guibg = '#162328',
	-- 		},
	-- 	close_button = {
	-- 		guibg = '#162328',
	-- 		},
	-- 	separator = {
	-- 		guibg = '#162328',
	-- 		},
	-- 	tab_close = {
	-- 		guibg = '#162328',
	-- 		},
	-- 	},
	-- }

	-- Syntax Highlighting
	require'nvim-treesitter.configs'.setup {
		ensure_installed = {
			"python", 
			"cpp",
			"c",
			"vim", 
			"lua",
			"javascript",
			"typescript",
			},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	}

	-- autocompletion
	--- Setup nvim-cmp.
	local cmp = require'cmp'

	cmp.setup({
		snippet = {
			expand = function(args)
			require('luasnip').lsp_expand(args.body)

		end,
	},
		mapping = {
			['<C-d>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.close(),
			['<CR>'] = cmp.mapping.confirm({ select = true }),
		},
		sources = {
			{ name = 'nvim_lsp' },

			{ name = 'luasnip' },

			{ name = 'buffer' },
		}
	})

EOF
