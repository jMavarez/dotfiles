local set = vim.keymap.set
-- More confortable to the fingers.
set("n", ";", ":")
set("i", "jf", "<Esc>")

-- Search
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")
set("n", "<Esc>", function()
	if vim.opt.hlsearch:get() then
		vim.cmd.nohl()
		return ""
	else
		return "<Esc>"
	end
end, { expr = true })

-- Selection
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- Clipboard
set("v", "<leader>y", '"+y', { desc = "Copy to OS clipboard" })

-- Navigation
set("n", "<leader>pv", vim.cmd.Ex)
set("n", "[d", ":lua vim.diagnostic.goto_prev()<CR> zz", { desc = "Go to previous [D]iagnostic message" })
set("n", "]d", ":lua vim.diagnostic.goto_next()<CR> zz", { desc = "Go to next [D]iagnostic message" })
set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
set("n", "<C-.>", "5<C-w>>", { desc = "Resize + [Width]" })
set("n", "<C-,>", "5<C-w><", { desc = "Resize - [Width]" })
set("n", "<C-;>", "5<C-w>-", { desc = "Resize + [Height]" })
set("n", "<C-'>", "5<C-w>+", { desc = "Resize - [Height]" })

set("n", "<C-d>", "<C-d>zz", { desc = "Page Down Centered" })
set("n", "<C-u>", "<C-u>zz", { desc = "Page Up Centered" })

set("n", "#", "#zz", { desc = "Previous match centered" })
set("n", "*", "*zz", { desc = "Next match centered" })
set("n", "g#", "g#zz", { desc = "Previous partial match centered" })
set("n", "g*", "g*zz", { desc = "Next partial match centered" })

-- Terminal
set("t", "<Esc>", "<C-\\><C-n>")
