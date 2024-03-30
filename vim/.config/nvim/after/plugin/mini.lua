-- local hipatterns = require('mini.hipatterns')
-- hipatterns.setup({
--   highlighters = {
--     -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
--     fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
--     hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
--     todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
--     note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
--
--     -- Highlight hex color strings (`#rrggbb`) using that color
--     hex_color = hipatterns.gen_highlighter.hex_color(),
--   },
-- })

require 'mini.ai'.setup { n_lines = 500 }
require 'mini.surround'.setup {}

local statusline = require 'mini.statusline'
-- set use_icons to true if you have a Nerd Font
statusline.setup {}

---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
  return '%2l:%-2v'
end
