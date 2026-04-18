require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup({
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = { 'clangd', 'lua_ls', 'rust_analyzer', 'pyright', 'bashls' },
    automatic_enable = false,
})

vim.lsp.config('clangd', {
  cmd = { 
	  'clangd', 
      '--background-index',
	  '--suggest-missing-includes',
	  '--clang-tidy', 
	  '--header-insertion=iwyu',
      '--completion-style=detailed',
      '--enable-config',
      '--j=4'
  },
  
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
  root_markers = { 'compile_commands.json', '.git' },
})

vim.lsp.enable('clangd')

-- Python LSP (pyright)
vim.lsp.config('pyright', {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'pyrightconfig.json', '.git' },
})
vim.lsp.enable('pyright')

-- Bash LSP
vim.lsp.config('bashls', {
    cmd = { 'bash-language-server', 'start' },
    filetypes = { 'sh', 'bash', 'zsh' },
    root_markers = { '.git', 'Makefile' },
})
vim.lsp.enable('bashls')

