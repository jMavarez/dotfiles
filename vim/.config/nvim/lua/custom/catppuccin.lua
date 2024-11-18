local theme = require("catppuccin")


theme.setup {
	flavour = "macchiato",
	term_colors = false,
	background = {
		light = "macchiato",
		dark = "macchiato",
	},
	transparent_background = true,
	styles = {
		comments = { "bold" },
		conditionals = { "bold" },
		loops = {},
		functions = { "bold" },
		keywords = { "italic" },
		strings = { "bold" },
		variables = {},
		numbers = { "bold" },
		booleans = { "bold" },
		properties = {},
		types = { "bold" },
	},
	color_overrides = {
		all = {
			base = "#080808",
			crust = "#080808",
			green = "#afd9aa",
		},
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = false,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
	},
	highlight_overrides = {
		macchiato = function(C)
			return {
				NvimTreeNormal = { bg = C.none },
				CmpBorder = { fg = C.none },
				PmenuSel = { bg = C.none, fg = C.peach, style = { "bold" } },
				WinSeparator = { bg = C.none, fg = C.none },
				TelescopeBorder = { link = "FloatBorder" },
				CursorLine = { bg = C.none },
				Cursor = { bg = "#FFFFFF" },
				LuaLine = { bg = C.none }
			}
		end,
	},
}

vim.cmd.colorscheme "catppuccin"
