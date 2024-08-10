return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<leader>x", function()
			harpoon:list():remove()
		end)
		vim.keymap.set("n", "<leader>ch", function()
			harpoon:list():clear()
		end)
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		for _, i in ipairs({ 1, 2, 3, 4 }) do
			vim.keymap.set("n", string.format("<C-%d>", i), function()
				harpoon:list():select(i)
			end)
		end
	end,
}
