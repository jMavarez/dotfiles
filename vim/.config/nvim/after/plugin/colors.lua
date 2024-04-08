require 'tokyonight'.setup {
    style = "night",
    transparent = true,
    italics = {
        comments = true,
        keywords = true,
        functions = true,
        strings = false,
        variables = false
    },
    colors = {
        bg_statusline = "#1a1b26",
        bg_sidebar = "#1a1b26",
        bg_float = "#1a1b26",
        bg_popup = "#1a1b26",
        bg_highlight = "#1a1b26"
    }
}
-- require 'caret'.setup({
--     options = {
--         transparent = true,
--     }
-- })
vim.cmd.colorscheme 'tokyonight'
-- vim.cmd.hi 'Comment gui=none'
--vim.cmd.colorscheme('caret')
