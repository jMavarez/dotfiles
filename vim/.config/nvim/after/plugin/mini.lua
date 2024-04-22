require 'mini.ai'.setup { n_lines = 500 }
require 'mini.surround'.setup {}

local statusline = require 'mini.statusline'
local active_group = function()
    local mode, mode_hl = statusline.section_mode({ trunc_width = 9999 })
    local git           = statusline.section_git({ trunc_width = 75 })
    local diagnostics   = statusline.section_diagnostics({ trunc_width = 75 })
    local filename      = statusline.section_filename({ trunc_width = 140 })
    local fileinfo      = statusline.section_fileinfo()
    local location      = statusline.section_location()
    local search        = statusline.section_searchcount({ trunc_width = 75 })
    local time          = statusline.section_time()

    local groups        = statusline.combine_groups({
        { hl = mode_hl,                 strings = { mode } },
        { hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics } },
        '%<', -- Mark general truncate point
        { hl = 'MiniStatuslineFilename', strings = { filename } },
        '%=', -- End left alignment
        { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
        { hl = mode_hl,                  strings = { search, location } },
        { hl = mode_hl,                  strings = { time } },
    })
    return groups
end

---@diagnostic disable: undefined-field
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_git = function(args)
    local head = vim.b.gitsigns_head or '-'
    local signs = MiniStatusline.is_truncated(args.trunc_width) and '' or (vim.b.gitsigns_status or '')
    local icon = ''

    -- Cantina config. I should move this to another folder
    local pattern = "feature/RED%-%d+%-+"
    if string.find(head, pattern) then
        head = string.gsub(head, pattern, "")
    end

    if signs == '' then
        if head == '-' or head == '' then return '' end
        return string.format('%s %s', icon, head)
    end
    return string.format('%s %s %s', icon, head, signs)
end

---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
    return '%2l:%-2v'
end

---@diagnostic disable-next-line: duplicate-set-field
statusline.section_fileinfo = function()
    local filetype = vim.bo.filetype
    return string.format('%s', filetype)
end

statusline.section_time = function()
    return '%{strftime("%H:%M")}'
end

statusline.setup {
    use_icons = true,
    content = {
        active = active_group,
        inactive = nil,
    },
}
