local plugins = {

  {"nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        -- web dev
        "html",
        "css",
        "javascript",
        "json",

        -- shell
        "bash",

        -- low level
        "c",
        "cpp",

        -- pre compiled
        "python",
        "rust",

        -- text
        "markdown",

        -- config
        "toml"
      },
    },
  },

  {"stevearc/aerial.nvim",
    ft = "python",
    opts = {},
    config = function()
      require("aerial").setup()
    end,
  },

  {"rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },

  {"mfussenegger/nvim-dap",
    config = function (_, opts)
      require("core.utils").load_mappings("dap")
    end
  },

  {"mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    },
    config = function (_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },

  {"jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function ()
     return require "custom.configs.null-ls"
    end,
  },

  {"williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "black",
        "debugpy",
        "pyright",
        "mypy",
        "ruff"
      },
    },
  },

  {"neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("neogen").setup({
        languages = {
          python = {
            template = {
              annotation_convention = "numpydoc"
            },
          },
        },
      })
    end,
  },

}

return plugins
