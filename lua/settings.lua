vim.cmd [[
	filetype on             " enable filetype detection
	filetype plugin on      " load file-specific plugins
	filetype indent on      " load file-specific indentation

	set whichwrap+=<,>,[,],h,l
]]

local options = {
  number = true,
  relativenumber = true,
  syntax = "aneble",
  clipboard = "unnamedplus",
  mouse = "a",
  encoding = "utf-8",
  cursorline = true,
  ruler = true,
  compatible = false,
  wrap = true,
  linebreak = true,
  showcmd = true,
  incsearch = true,
  showmode = false,
  autowriteall = true,
  shiftwidth = 2,
  softtabstop = 2,
  tabstop = 2,
  pumheight = 10,
  cmdheight = 2,
  conceallevel = 1,
  colorcolumn = "80",
  scrolloff = 7,
  signcolumn = "yes"
}

for i, j in pairs(options) do
	vim.opt[i] = j
end

if vim.cmd [["termguicolors"]] then
	vim.opt.termguicolors = true
end

-- TeX
vim.g.tex_flavor = 'latex'
vim.g.tex_conceal = 'abdmgs'

-- Conceal
vim.cmd [[hi Conceal ctermbg=none]]

-- UltiSnips
vim.g.UltiSnipsExpandTrigger = '<tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
