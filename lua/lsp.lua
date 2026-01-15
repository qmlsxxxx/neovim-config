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
    ensure_installed = { 'clangd', 'lua_ls', 'rust_analyzer' },
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

