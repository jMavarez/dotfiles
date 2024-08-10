return {
  'nvim-lua/plenary.nvim',
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-telescope/telescope-ui-select.nvim' },
    },
    config = function()
      require 'custom.telescope'
    end,
  },
}
