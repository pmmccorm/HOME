-- syntax on breaks folding w/ tree-sitter
-- so turn it off for python files
vim.cmd([[

autocmd Filetype python setlocal syntax=off
colorscheme torte

" https://stackoverflow.com/questions/7894330/preserve-last-editing-position-in-vim
" Return to last edit position when opening files (You want this!)
" autocmd BufReadPost *
"     \ if line("'\"") > 0 && line("'\"") <= line("$") |
"     \   exe "normal! g`\"" |
"     \ endif

]])

--set foldmethod=expr
--set foldexpr=nvim_treesitter#foldexpr()

vim.o.tabstop = 8
vim.o.shiftwidth = 8
vim.o.expandtab = false
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.modeline = true
vim.o.undofile = true


vim.o.ruler = true
vim.o.showmode = true
vim.o.guicursor = ''

vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.termguicolors = true

vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.showmatch = true

-- tree-sitter folding
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevelstart = 1
vim.o.foldnestmax = 1

-- completion
vim.o.completeopt='menuone,noinsert,noselect'

-- diagnostics?
vim.diagnostic.config {
  virtual_text = true,
  signs = true,
  underline = true,
}
