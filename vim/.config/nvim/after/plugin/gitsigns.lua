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
        --        map('n', '<leader>hs', gs.stage_hunk)
        --        map('n', '<leader>hr', gs.reset_hunk)
        --        map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        --        map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        --        map('n', '<leader>hS', gs.stage_buffer)
        --        map('n', '<leader>hu', gs.undo_stage_hunk)
        --        map('n', '<leader>hR', gs.reset_buffer)
        --        map('n', '<leader>hp', gs.preview_hunk)
        --        map('n', '<leader>hb', function() gs.blame_line { full = true } end)
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
        --        map('n', '<leader>hd', gs.diffthis)
        --        map('n', '<leader>hD', function() gs.diffthis('~') end)
        --        map('n', '<leader>td', gs.toggle_deleted)

        -- Text object
        --        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
}
