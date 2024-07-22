require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- petites features
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- navigation avec tmux
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Tmux window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Tmux window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Tmux window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Tmux window up" })

-- outline du ficher courant
map("n", "<leader>a", "<cmd> AerialToggle! <CR>", { desc = "toggle aerial window"})

-- genere une docstring
map("n", "<leader>nf", ":lua require('neogen').generate()<CR>", { desc = "generate docstring with neogen", noremap = true, silent = true})

-- lance le script python courant dans un terminal
map("n", "<F4>", ":w <bar> exec '!python3 '.shellescape('%')<CR>", { desc = "run current python file"})

-- enleve les messages Noice
map("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "dismiss noice message"})

-- debugger mappings
-- set a breakpoint
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "toggle dap breakpoint"})
map("n", "<leader>dc", function ()
  require("dap").continue()
end)

-- run pytohn debugger
map("n", "<leader>dpr", function ()
  require("dap-python").test_method()
end)

-- obsidian.nvim
map("n", "<leader>od", "<cmd>ObsidianToday<CR>", { desc = "open/create a new daily note"})
map("n", "<leader>oy", "<cmd>ObsidianToday -1<CR>", { desc = "open/create yesterday's note"})
map("n", "<leader>ot", "<cmd>ObsidianToday 1<CR>", { desc = "open/create tomorrow's note"})
map("n", "<leader>oa", "<cmd>ObsidianDailies<CR>", { desc = "open a picker list of daily notes"})
map("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "open in obsidian app"})
map("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "show obsidian backlinks"})
map("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "show obsidian links"})
map("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "create new note"})
map("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "search or create notes in vault"})
map("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "quick switch to (or open) another note in vault"})
