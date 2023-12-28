-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()

-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies".
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require('packer').startup(function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        ---------------------------------------
        -- NOTE: PUT YOUR THIRD PLUGIN HERE --
        ---------------------------------------
		use { 'vijaymarupudi/nvim-fzf' }

		-- colorscheme
		use { 'tanvirtin/monokai.nvim' }
		use { 'ofirgall/ofirkai.nvim' }

		-- auto-completion
		use { 'neovim/nvim-lspconfig' }
		use { 'hrsh7th/nvim-cmp', config = [[require('config.nvim-cmp')]] }
		use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
		use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' } -- buffer auto-completion
		use { 'hrsh7th/cmp-path', after = 'nvim-cmp' } -- path auto-completion
		use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' } -- cmdline auto-completion
		use { 'onsails/lspkind-nvim' }

		-- For ultisnips users.
		use { 'SirVer/ultisnips' }
		use { 'quangnguyen30192/cmp-nvim-ultisnips' }

		-- lsp
		use { 'williamboman/mason.nvim' }
		use { 'williamboman/mason-lspconfig.nvim'}

		-- taglist
		use { 'majutsushi/tagbar' }
		-- use { 'liuchengxu/vista.vim' }
		-- use { 'simrat39/symbols-outline.nvim' }

		-- Telescope fuzzy finder --
		use { 'nvim-telescope/telescope.nvim', tag = '0.1.5',requires = { {'nvim-lua/plenary.nvim'} } }
    	use { 'nvim-treesitter/nvim-treesitter', tag= 'v0.9.1', run = ':TSUpdate' }

		-- File Explorer --
		use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }

		-- Tabline --
		use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
		use { 'lewis6991/gitsigns.nvim' } -- OPTIONAL: for git status
		use { 'romgrk/barbar.nvim' }

		-- terminal --
		use {"akinsho/toggleterm.nvim", tag = '*', config = function()
			require("toggleterm").setup()
		end }
		-- use {'voldikss/vim-floaterm'}

		-- Startup time --
		use { 'dstein64/vim-startuptime' }
		use { 'lewis6991/impatient.nvim' }

		use({ 'vladdoster/remember.nvim', config = [[ require('remember') ]] })

		-- Startup page
		use { 'nvimdev/dashboard-nvim', event = 'VimEnter', config = function()
			require('dashboard').setup {
      		-- config
    		}
  			end,
  			requires = {'nvim-tree/nvim-web-devicons'}
		}
		--use {
	    --	'goolord/alpha-nvim',
    	--	requires = { 'nvim-tree/nvim-web-devicons' },
    	--	config = function ()
 		--       	require'alpha'.setup(require'alpha.themes.startify'.config)
   		--	 end
		--}

		use { 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim' }

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require('packer').sync()
        end
    end)

