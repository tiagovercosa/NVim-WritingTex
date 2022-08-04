-- Instalando automaticamente packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    "git", "clone", "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  }

  print "Instalando o packer. Feche e reabra o Neovim..."
  vim.cmd [[ packadd packer.nvim ]]
end

-- O packer usa uma janela popup
require('packer').init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Instalar seus plugins aqui
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- Lua Line
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- Nord Theme
	use 'shaunsingh/nord.nvim'

	-- Buffer linne
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require("bufferline").setup()
    end
  }

  -- Personal Wiki in Vim
  use {
    'vimwiki/vimwiki',
    config = function()
      vim.g.vimwiki_list = {
        {
          path = '~/doc/repos/mywiki',
          path_html = '~/dox/repos/mywiki/html_path'
        }
      }
      vim.g.vimwiki_global_ext = 0
      vim.g.vimwiki_listsyms = ' ○◐●✗'
    end
  }

  -- Alpha startfy
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.startify'.config)
      local startify = require("alpha.themes.startify")
      startify.section.mru_cwd.val = { { type = "padding", val = 0 } }
      startify.section.bottom_buttons.val = {
        startify.button("w", "Wiki", ":VimwikiIndex<cr>"),
        startify.button("v", "Neovim Config", ":e ~/.config/nvim/init.lua<cr>"),
        startify.button("q", "QUIT NEOVIM", ":qa<cr>"),
      }
      vim.api.nvim_set_keymap('n', '<c-n>', ':Alpha<cr>', {noremap = true})
    end
  }

	-- NvimTree
	use {
	  'kyazdani42/nvim-tree.lua',
	  requires = {
	    'kyazdani42/nvim-web-devicons',
	  },
	  tag = 'nightly'
	}

	-- IDE
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end
  }
  use 'williamboman/nvim-lsp-installer'     -- simple to use language server installer
  use 'neovim/nvim-lspconfig'               -- Configurations for Nvim LSP
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lua'
  use 'quangnguyen30192/cmp-nvim-ultisnips'

	-- Latex language
	use 'SirVer/ultisnips'
  use 'lervag/vimtex'
	use 'KeitaNakamura/tex-conceal.vim'
	use 'windwp/nvim-autopairs'
  use 'tpope/vim-surround'
  use 'chrisbra/Colorizer'
end)
