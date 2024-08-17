return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      require('mini.surround').setup()

      -- Simple and easy statusline.
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- Simple start-up screen
      local starter = require 'mini.starter'
      starter.setup {
        evaluate_single = true,
        items = {
          { name = 'search files', action = ':Telescope find_files', section = 'actions' },
          { name = 'new buffer', action = ':enew', section = 'actions' },
          { name = 'quit', action = ':qa!', section = 'actions' },
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(),
          starter.gen_hook.aligning('center', 'center'),
        },
        header = 'neovim',
        footer = '',
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
