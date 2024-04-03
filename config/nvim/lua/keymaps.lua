-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
local map = vim.keymap.set
vim.opt.hlsearch = true
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Open Sidebar' })
map('n', '<leader>gg', '<cmd>LazyGit<CR>', { desc = 'Open Lazygit' })
map('n', '<leader>p', '<cmd>Telescope project<CR>', { desc = 'Open Projects' })

-- Tabs
map('n', '<C-w>', '<cmd> :BufferCloseAllButCurrent <CR>', { desc = 'Kill all tabs' })
map('n', '<tab>', '<cmd> BufferNext <CR>', { desc = 'Next Buffer' })
map('n', '<S-Tab>', '<cmd> BufferPrevious <CR>', { desc = 'Previous Buffer' })

map('n', '<leader>x', '<Cmd>BufferClose<CR>', { desc = 'Close buffer' })
map('n', '<leader>q', '<Cmd>BufferClose<CR>', { desc = 'Close buffer' })
map('n', '<leader>Q', '<Cmd>:qa!<CR>', { desc = 'Close Neovim' })

-- Format
map({ 'n', 'v' }, '<leader>=', function()
  require("conform").format({
    lsp_fallback = true,
    async = false,
    timeout = 500
  })
end, { desc = 'Format Document' })

-- lint
map('n', '<leader>l', function()
  require("lint").try_lint()
end, { desc = 'Lint for current file' })

map('n', '<leader>ww', "<cmd>:w<CR>", { desc = "Save File" })
map('n', '<leader>wq', "<cmd>:wq<CR>", { desc = "Save and Quit" })

-- Comment
--
map({ "n", "v" }, "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Comment Toggle" })


-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
