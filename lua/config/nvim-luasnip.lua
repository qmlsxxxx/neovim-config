-- ~/.config/nvim/lua/config/luasnip.lua
local ls = require('luasnip')

ls.config.set_config({
  -- 啟用歷史記錄，允許跳回之前的 snippet
  history = true,

  -- 動態更新 snippet 內容
  updateevents = 'TextChanged,TextChangedI',

  -- 啟用自動 snippets（輸入即觸發，不需要按 tab）
  enable_autosnippets = true,

  -- 使用 VSCode 風格的 snippet 格式
  store_selection_keys = '<Tab>',
})

-- 載入 friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()

-- 載入自訂 snippets（如果有）
-- require('luasnip.loaders.from_vscode').load({ paths = { './snippets' } })
-- require('luasnip.loaders.from_lua').load({ paths = './luasnippets' })

-- 快速跳轉鍵位
vim.keymap.set({ 'i', 's' }, '<C-k>', function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-j>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set('i', '<C-l>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

-- 列出可用 snippets（可選）
vim.keymap.set('n', '<leader><leader>s', '<cmd>source ~/.config/nvim/lua/config/luasnip.lua<CR>')
