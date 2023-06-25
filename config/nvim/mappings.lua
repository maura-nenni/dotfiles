local M = {}

-- global mappins
M.abc = {
  n = {
    ["<leader>a"] = {"<cmd> AerialToggle! <CR>", "toggle aerial window"},
  },

  i = {
    ["jk"] = {"<ESC>", "escape insert mode", opts = { nowait = true}}
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
  }
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

-- M.aerial = {
--   plugin = true,
--   n = {
--   }
-- }

return M
