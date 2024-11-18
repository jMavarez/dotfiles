require("lspkind").init({
	mode = 'symbol_text'
})
local cmp = require("cmp")
local luasnip = require("luasnip")
luasnip.config.setup {}

cmp.setup {
	preselect = 'item',
	completion = {
		completeopt = 'menu,menuone,noinsert'
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = "nvim_lsp", priority = 100 },
		{ name = "luasnip",  priority = 75 },
		{ name = "path",     priority = 50 },
	},
	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		-- ["<C-y>"] = cmp.mapping(
		-- 	cmp.mapping.confirm({
		-- 		behavior = cmp.ConfirmBehavior.Insert,
		-- 		select = true,
		-- 	}),
		-- 	{ "i", "c" }
		-- ),
		["<CR>"] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Select,
			select = true,
		},
	},
	window = {
		completion = {
			border = "rounded",
			-- winhighlight = "Normal:CmpNormal,",
			winhighlight = 'Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
		},
		documentation = {
			border = "rounded",
		},
	},
}
