---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["x"] = { '"_x', "Single character not in register", opts = { nowait = true } },
    ["<leader>;"] = { "<cmd>Nvdash<CR>", "Open Dashboard", opts = { nowait = true } },
    ["<leader>sv"] = { "<cmd>sp<CR>", "Split Vertically", opts = { nowait = true } },
    ["<leader>sh"] = { "<cmd>vs<CR>", "Split Horizontally", opts = { nowait = true } },

    ["<leader>q"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close buffer",
    },
    ["<leader>qq"] = {
      function()
        require("nvchad_ui.tabufline").closeAllBufs()
      end,
      "Close buffer",
    },
    ["<leader>QQ"] = { "<cmd>qa<CR>", "Quit Neovim" },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- focus
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.git = {
  n = {
    ["<leader>gg"] = { "<cmd>LazyGit<CR>", "Open Lazygit" },
  },
}

M.telescope = {
  n = {
    ["<leader>p"] = { "<cmd>Telescope projects<CR>", "Show Projects" },
  },
}
-- more keybinds!

return M
