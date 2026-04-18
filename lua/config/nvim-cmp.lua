-- Setup nvim-cmp.
local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require('luasnip')

cmp.setup {
  snippet = {
    expand = function(args)
		luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
	["<C-d>"] = cmp.mapping.scroll_docs(-4),
	["<C-f>"] = cmp.mapping.scroll_docs(4),
	['<C-Space>'] = cmp.mapping.complete(),
	["<C-e>"] = cmp.mapping.abort(),
	["<CR>"] = cmp.mapping.confirm({ select = true }),
	["<Esc>"] = cmp.mapping.close(),

	["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		elseif luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		else
			fallback()
		end
	end, { 'i', 's' }),

	['<S-Tab>'] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		elseif luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	  end, { 'i', 's' }),
	}),

	sources = {
		{ name = 'luasnip' },
		{ name = "nvim_lsp" }, -- For nvim-lsp
		{ name = "path" }, -- for path completion
		{ name = "buffer", keyword_length = 2 }, -- for buffer word completion
	},
	completion = {
		keyword_length = 1,
		completeopt = "menu,noselect",
	},
	view = {
		entries = "custom",
	},
	formatting = {
		format = lspkind.cmp_format {
			mode = "symbol",
			preset = 'codicons',
			-- preset = 'default',
			menu = {
				nvim_lsp = "[LSP]",
				nvim_lua = "[Lua]",
				luasnip = '[Snip]',
				path = "[Path]",
				buffer = "[Buffer]",
				emoji = "[Emoji]",
				omni = "[Omni]",
			},
		},
	},
}

cmp.setup.filetype("tex", {
  sources = {
    { name = "omni" },
    { name = "buffer", keyword_length = 2 }, -- for buffer word completion
    { name = "path" }, -- for path completion
  },
})

--  see https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-add-visual-studio-code-dark-theme-colors-to-the-menu
vim.cmd([[
  highlight! link CmpItemMenu Comment
  " gray
  highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
  " blue
  highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
  highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
  " light blue
  highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
  " pink
  highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
  highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
  " front
  highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
  highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
  highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
]])
