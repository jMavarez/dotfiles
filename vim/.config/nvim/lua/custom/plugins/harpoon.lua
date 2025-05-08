return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup {
			settings = {
				save_on_toggle = true
			}
		}

		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
		vim.keymap.set("n", "<leader>x", function() harpoon:list():remove() end)
		vim.keymap.set("n", "<leader>ch", function() harpoon:list():clear() end)
		vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

		vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
		vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

		for _, i in ipairs({ 1, 2, 3, 4 }) do
			vim.keymap.set("n", string.format("<C-%d>", i), function()
				harpoon:list():select(i)
			end)
		end
	end,
}
