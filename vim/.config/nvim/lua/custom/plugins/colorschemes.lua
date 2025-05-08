return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require 'custom.catppuccin'
			-- vim.cmd.colorscheme("antiphoton")
			-- vim.cmd.colorscheme("gitgud_light")
			-- vim.cmd.colorscheme("github_light")
			-- vim.cmd.colorscheme("tokyonight-night")
			-- vim.cmd.colorscheme("intellij")
		end,
	},
	"dzfrias/noir.nvim",
	"pgdouyon/vim-yin-yang",
	"yunlingz/equinusocio-material.vim",
	"projekt0n/caret.nvim",
	"axvr/photon.vim",
	"jaredgorski/fogbell.vim",
	"elianiva/gitgud.nvim",
	"projekt0n/github-nvim-theme",
	"atelierbram/Base4Tone-nvim",
	"jascha030/nitepal.nvim",
	"chiendo97/intellij.vim",
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
}
