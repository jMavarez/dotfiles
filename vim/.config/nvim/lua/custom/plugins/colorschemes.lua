return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gitgud_dark")
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
	"atelierbram/Base4Tone-nvim",
	"jascha030/nitepal.nvim",
	"chiendo97/intellij.vim",
}
