-- Goto use :
-- ]d next
-- [d previous

return {
  {
    'mfussenegger/nvim-lint',
    run = 'pip3 install cpplint --upgrade',

    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        cpp = { 'cpplint' },
        python = { 'pylint' },
      }

      --Run linter on save
      vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
        callback = function()
          lint.try_lint()
          lint.try_lint 'cspell'
          lint.try_lint 'write_good'
        end,
      })
    end,
  },
}
