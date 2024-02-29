---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["x"] = { '"_x', "Single character not in register", opts = { nowait = true } },
    ["<leader>;"] = { "<cmd>Nvdash<CR>", "Open Dashboard", opts = { nowait = true } },
    ["<leader>sv"] = { "<cmd>sp<CR>", "Split Vertically", opts = { nowait = true } },
    ["<leader>sh"] = { "<cmd>vs<CR>", "Split Horizontally", opts = { nowait = true } },
    ["<leader>bn"] = { "<cmd> enew <CR>", "New buffer" },
    ["<leader>bK"] = { "<cmd>bufdo bd<CR>", "Kill all Buffers", opts = { nowait = false } },
    ["<A-j>"] = {"<Esc>:m .+1<CR>", "Move line down",opts={nowait=true}},
    ["<A-k>"] = {"<Esc>:m .-2<CR>", "Move line up",opts={nowait=true}},
  },
  i = {
    ["<A-j>"] = {"<Esc>:m .+1<CR>==gi", "Move line down",opts={nowait=true}},
    ["<A-k>"] = {"<Esc>:m .-2<CR>==gi", "Move line up",opts={nowait=true}},
  },
  v = {
    ["<A-j>"] = { ":m '>+1<CR>gv-gv", "Move block one line down" },
    ["<A-k>"] = { ":m '<-2<CR>gv-gv", "Move block one line up" },
  }
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

M.spectre = {
  n = {
    ["<leader>S"] = {
      function()
        require("spectre").toggle()
      end,
      "Open Search buffer",
    },
    ["<leader>sw"] = {
      function()
        require("spectre").open_visual { select_word = true }
      end,
      "Search Current word",
    },
    ["<leader>sf"] = {
      function()
        require("spectre").open_file_search { select_word = true }
      end,
      "Search on current file",
    },
  },
}
M.undotree = {
  n = {
    ["<leader>u"] = { "<cmd>UndotreeToggle<CR>", "Toggle Undo Tree" }
  }
}
-- more keybinds!

return M
