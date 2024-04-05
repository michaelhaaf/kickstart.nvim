return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  config = function()
    local ufo = require 'ufo'
    ufo.setup {
      open_fold_hl_timeout = 100,
      provider_selector = function(bufnr, filetype, buftype)
        return { 'lsp', 'indent' }
      end,
    }
    -- vim.keymap.set('n', 'zR', ufo.openAllFolds, { desc = 'Open all folds' })
    -- vim.keymap.set('n', 'zM', ufo.closeAllFolds, { desc = 'Close all folds' })
    -- vim.keymap.set('n', 'zr', ufo.openFoldsExceptKinds, { desc = 'Open more folds' })
    -- vim.keymap.set('n', 'zm', ufo.closeFoldsWith, { desc = 'Close more folds' })
    vim.keymap.set('n', 'zK', function()
      local winid = ufo.peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = 'Peek Fold' })
  end,
}
