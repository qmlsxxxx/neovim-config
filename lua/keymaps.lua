-- define common options
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }

--[[
#Useful hotkey functions

\cd : change working directory to current opened file
\ff : find files under current working directory
\fg : live grep under current working directory
\fj : fuzzy find at current buffer
\fb : grep buffer
\fh : help tags
<C-e> : toggle NvimTree file explorer 
<C-o> : NvimTree jump to current opened file location in file explorer
<C-f> : grep pattern in current buffer tab, results show in new buffer tab
F12 : toggle taglist

#Programming languages

gd : goto definition
gD : goto declaration
gr : goto references
gi : goto implementation
K  : vim.lsp.buf.hover, opts)
<C-k> : vim.lsp.buf.signature_help
a<space>D : vim.lsp.buf.type_definition 
<space>wa : vim.lsp.buf.add_workspace_folder
<space>wr : vim.lsp.buf.remove_workspace_folder
<space>wl : 
<space>rn : 
<space>ca : 

<space>e : vim.diagnostic.open_float
[d : vim.diagnostic.goto_prev
]d : vim.diagnostic.goto_next
<space>q : vim.diagnostic.setloclist

--]]

map('i', '<S-Tab>', '<C-d>', opts)

map('n', '<SPACE>', ':noh<CR>', opts)
map('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>| change working directory to current opened file', opts)
map('n', '<C-f>', ':tabnew|0r!grep -n  #<Left><Left>| grep pattern in current buffer tab, results show in new buffer tab', opts)
map('n', '<F3>', '*N', opts)

-- Resize with arrowr
-- delta: 2 lines
map('n', '>', '<C-w>><C-w>', opts)
map('n', '<', '<C-w><<C-w>', opts)

-- Better window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', 'rC-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

map('n', '<C-Up>', ':resize -2<CR>', opts)
map('n', '<C-Down>', ':resize +2<CR>', opts)
map('n', '<C-Left>', ':vertical resize -2<CR>', opts)
map('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Move to previous/next
map('n', 'th', ':BufferPrevious<CR>', opts)
map('n', 'tl', ':BufferNext<CR>', opts)
map('n', 'tc', ':BufferClose!<CR>', opts)

-- Goto buffer in prsition...
map('n', '<A-1>', ':BufferGoto 1<CR>', opts)
map('n', '<A-2>', ':BufferGoto 2<CR>', opts)
map('n', '<A-3>', ':BufferGoto 3<CR>', opts)
map('n', '<A-4>', ':BufferGoto 4<CR>', opts)
map('n', '<A-5>', ':BufferGoto 5<CR>', opts)
map('n', '<A-6>', ':BufferGoto 6<CR>', opts)
map('n', '<A-7>', ':BufferGoto 7<CR>', opts)
map('n', '<A-8>', ':BufferGoto 8<CR>', opts)
map('n', '<A-9>', ':BufferGoto 9<CR>', opts)
map('n', '<A-0>', ':BufferLast<CR>', opts)

-- taglist
-- map('n', '<ESC>O[', ':Vista!!<CR>', opts)
map('n', '<ESC>O[', ':TagbarToggle<CR>| toggle taglist', opts)

-- NvimTree
map('n', '<C-e>', ':NvimTreeToggle<CR>| jump to current opened file location in file explorer', opts)
map('n', '<C-o>', ':NvimTreeFindFileToggle!<CR>| toggle NvimTree file explorer', opts)

-- Toggleterm
map("t", "<Esc>j", '<C-\\><C-n><C-w><C-w>v<Esc>', opts)
map("t", "<Esc>n", '<C-\\><C-n><Esc>', opts)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fj', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Customized on_attach function
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local lspopts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, lspopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, lspopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, lspopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, lspopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, lspopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, lspopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, lspopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, lspopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, lspopts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, lspopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, lspopts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, lspopts)
    --vim.keymap.set('n', '<space>f', function()
    --  vim.lsp.buf.format { async = true }
    --end, lspopts)
  end,
})

local bm = require "bookmarks"
vim.keymap.set("n","mm",bm.bookmark_toggle) -- add or remove bookmark at current line
vim.keymap.set("n","mi",bm.bookmark_ann) -- add or edit mark annotation at current line
vim.keymap.set("n","mc",bm.bookmark_clean) -- clean all marks in local buffer
vim.keymap.set("n","mn",bm.bookmark_next) -- jump to next mark in local buffer
vim.keymap.set("n","mp",bm.bookmark_prev) -- jump to previous mark in local buffer
vim.keymap.set("n","ml",':Telescope bookmarks list<CR>') -- show marked file list in telescope window

