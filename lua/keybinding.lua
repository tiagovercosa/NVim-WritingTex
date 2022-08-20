vim.g.mapleader = ";"
vim.g.maplocalleader = ","

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- LPS keybindings
local function nkeymap(key, map)
  keymap('n', key, map, opts)
end

nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')

-- Map `j` to `gj` and `k` to `gk`, which makes it easier to navigate wrapped lines.
keymap( 'n', 'j', 'gj', opts )
keymap( 'n', 'k', 'gk', opts )

-- Buffer management
keymap( 'n', '<A-.>', ':bnext<CR>', opts )
keymap( 'n', '<A-,>', ':bprev<CR>', opts )
keymap( 'n', '<A-c>', ':bdelete<CR>', opts )

-- Better window navigation
keymap( 'n', '<C-h>', '<C-w>h', opts )
keymap( 'n', '<C-j>', '<C-w>j', opts )
keymap( 'n', '<C-k>', '<C-w>k', opts )
keymap( 'n', '<C-l>', '<C-w>l', opts )

-- Compile the current file
keymap( 'n', '<C-c>', ':!compiler % <cr>', opts )

-- Open the output file from the opened file
keymap( 'n', '<C-o>', ':!opout % <cr><cr>', opts )

-- KeyBinding  for nvim-tree
keymap( 'n', '<leader>e', ':NvimTreeToggle<CR>', opts )
keymap( 'n', '<leader>r', ':NvimTreeRefresh<CR>', opts )

-- Inkscape-Figures
vim.cmd [[
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>

nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
]]
