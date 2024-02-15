vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('n', '<leader>h', vim.cmd.wincmd('h'))
vim.keymap.set('n', '<leader>j', vim.cmd.wincmd('j'))
vim.keymap.set('n', '<leader>k', vim.cmd.wincmd('k'))
vim.keymap.set('n', '<leader>l', vim.cmd.wincmd('l'))

vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'>-2<CR>gv=gv')

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
