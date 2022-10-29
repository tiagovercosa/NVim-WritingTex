local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require'lspconfig'

require("nvim-lsp-installer").setup {
  automatic_installation = true,      -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    cons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
}

lspconfig.texlab.setup { capabilities = capabilities }
lspconfig.pyright.setup { capabilities = capabilities }
lspconfig.sumneko_lua.setup {
	capabilities = capabilities,
	settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'},
      },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		}
	}
}

lspconfig.ltex.setup {
	capabilities = capabilities,
	settings = {
		ltex = {
			enabled = {"latex", "bibtex", "markdown"},
			language =  "pt-BR",
			dictionary = {
				['pt-BR'] = { 'Verçosa', 'Dayene', 'Tight', 'Bloch', 'Dirac' },
			}
		}
	}
}
