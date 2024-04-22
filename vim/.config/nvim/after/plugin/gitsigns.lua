local gitsigns = require('gitsigns')
gitsigns.setup {
    on_attach = function(bufnr)
        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', '.h', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gitsigns.next_hunk() end)
            return '<Ignore>'
        end, { expr = true })

        map('n', ',h', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gitsigns.prev_hunk() end)
            return '<Ignore>'
        end, { expr = true })

        -- Actions
        map('n', '<leader>hdf', gitsigns.diffthis, { desc = 'Git: [H]unk [D]if[F]' })
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Git: [T]oggle [B]lame' })
        map('n', '<leader>td', gitsigns.toggle_deleted, { desc = 'Git: [T]oggle [D]eleted' })
        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Git: [H]unk [S]tage' })
        map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Git: [H]unk [P]review' })
        --        map('n', '<leader>hr', gs.reset_hunk)
        --        map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        --        map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        --        map('n', '<leader>hS', gs.stage_buffer)
        --        map('n', '<leader>hR', gs.reset_buffer)
        --        map('n', '<leader>hb', function() gs.blame_line { full = true } end)
        --        map('n', '<leader>hD', function() gs.diffthis('~') end)

        -- Text object
        --        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
}
