local M = {}

-- global mappins
M.general = {

  n = {

    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "Tmux window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "Tmux window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "Tmux window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "Tmux window up" },

    ["<leader>a"] = {"<cmd> AerialToggle! <CR>", "toggle aerial window"},
    ["<leader>nf"] = {":lua require('neogen').generate()<CR>", "generate docstring with neogen", opts = { noremap = true, silent = true}},
    ["<F4>"] = { ":w <bar> exec '!python3 '.shellescape('%')<CR>", "run current python file"},
  },

  i = {
    ["jk"] = {"<ESC>", "escape insert mode", opts = { nowait = true}},
  },
}

-- debugger mappings
-- set a breeakpoint
M.dap ={
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>", "toggle dap breakpoint"},
    ["<leader>dc"] = {
      function ()
        require("dap").continue()
      end
    }
  },
}

-- run python debugger
M.dap_python ={
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function ()
       require("dap-python").test_method()
      end
    }
  }
}

return M
