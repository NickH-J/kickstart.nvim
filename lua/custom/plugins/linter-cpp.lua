-- Goto use :
-- ]d next
-- [d previous
vim.opt.colorcolumn = '80'
vim.cmd 'highlight ColorColumn ctermbg=0 guibg=darkred'
return {
  {
    'mfussenegger/nvim-lint',
    run = 'pip3 install cpplint --upgrade',
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        cpp = { 'cpplint' },
      }
      --Run linter on save
      vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
        callback = function() lint.try_lint() end,
      })
    end,
  },
}
