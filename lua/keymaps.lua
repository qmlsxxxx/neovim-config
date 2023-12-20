-- define common options
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }

map('n', '<SPACE>', ':noh<CR>', opts)

map('n', '<leader>rr', '<cmd>lua ReloadConfig()<CR>', opts)
map('n', '<leader>bb', '<cmd>lua ReloadConfig()<CR>', opts)

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
map('n', 'tc', ':BufferClose<CR>', opts)

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
map('n', '<ESC>O[', ':Vista!!<CR>', opts)

-- NvimTree
map('n', '<C-e>', ':NvimTreeToggle<CR>', opts)

-- Toggleterm
map("t", "<Esc>j", '<C-\\><C-n><C-w><C-w>v<Esc>', opts)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
