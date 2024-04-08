require 'mini.ai'.setup { n_lines = 500 }
require 'mini.surround'.setup {}

local statusline = require 'mini.statusline'
local active_group = function()
    local mode, mode_hl = statusline.section_mode({ trunc_width = 9999 })
    local git           = statusline.section_git({ trunc_width = 75 })
    local diagnostics   = statusline.section_diagnostics({ trunc_width = 75 })
    local filename      = statusline.section_filename({ trunc_width = 140 })
    local fileinfo      = statusline.section_fileinfo({ trunc_width = 120 })
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

---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
    return '%2l:%-2v'
end

statusline.section_time = function()
    return '%{strftime("%H:%M")}'
end

statusline.setup {
    -- use_icons = true,
    content = {
        active = active_group,
        inactive = nil,
    },
}
