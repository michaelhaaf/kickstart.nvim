-- See: https://github.com/nvim-lua/kickstart.nvim?tab=readme-ov-file#example-adding-a-file-tree-plugin

-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  -- keys = {
  --   { "n", "<leader>e", ":Neotree<CR>", { silent = true } },
  -- },
  config = function()
    require('neo-tree').setup {
      close_if_last_window = true,
      vim.keymap.set('n', '\\', ':Neotree toggle<CR>', { silent = true }),
      vim.keymap.set('n', '|', ':Neotree toggle current reveal_force_cwd<cr>', { silent = true }),
      vim.keymap.set('n', '<leader>ft', ':Neotree toggle<cr>', { silent = true, desc = '[F]ile [T]ree' }),
      vim.keymap.set('n', '<leader>bt', ':Neotree toggle show buffers right<cr>', { silent = true, desc = '[B]uffer [T]ree' }),

      event_handlers = {
        {
          event = 'neo_tree_popup_input_ready',
          ---@param args { bufnr: integer, winid: integer }
          handler = function(args)
            vim.cmd 'stopinsert'
            vim.keymap.set('i', '<esc>', vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
          end,
        },
      },
    }
  end,
}
