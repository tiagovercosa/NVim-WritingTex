require'nvim-treesitter'.setup {}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
 		disable = { "latex" }
  }
}

-- Teclas "zo" e "zc"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
