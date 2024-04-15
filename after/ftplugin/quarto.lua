vim.b.slime_cell_delimiter = '```'
vim.b['quarto_is_r_mode'] = nil
vim.b['reticulate_running'] = false

vim.wo.showbreak = '|'
vim.cmd('setlocal spell')
vim.cmd('setlocal wrap')
vim.cmd('setlocal linebreak')
vim.cmd('setlocal breakindent')

-- don't run vim ftplugin on top
vim.api.nvim_buf_set_var(0, 'did_ftplugin', true)

-- markdown vs. quarto hacks
local ns = vim.api.nvim_create_namespace 'quartoHighlight'
vim.api.nvim_set_hl(ns, '@markup.strikethrough', { strikethrough = false })
vim.api.nvim_set_hl(ns, '@markup.doublestrikethrough', { strikethrough = true })
vim.api.nvim_win_set_hl_ns(0, ns)

vim.treesitter.language.register('markdown', 'mdx')
vim.treesitter.language.register('markdown', 'qmd')
vim.treesitter.language.register('markdown', 'mdoc')

