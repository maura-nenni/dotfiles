return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  -- {
  --   "christoomey/vim-tmux-navigator",
  --   lazy = false,
  -- },

  {
    "jedrzejboczar/possession.nvim",
    lazy=false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      require('possession').setup {
        commands = {
          save = 'SSave',
          load = 'SLoad',
          delete = 'SDelete',
          list = 'SList',
        },
        plugins = { delete_hidden_buffers = false },
      }
    end
  },

  {"nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",
        "regex",

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
        "markdown_inline",

        -- config
        "toml"
      },
    },
  },

  {"stevearc/aerial.nvim",
    ft = {"python", "c", "cpp", "bash", "markdown", "latex", "lua", "rust", "julia", "make", "typescript", "yaml", "rst", "php"},
    opts = {},
    config = function()
      require("aerial").setup()
    end,
  },

  {"rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
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
      -- require("core.utils").load_mappings("dap")
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
      -- require("core.utils").load_mappings("dap_python")
    end,
  },

  {"jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function ()
     return require "configs.null-ls"
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
        "ruff",
        "ltex-ls",
      },
    },
  },

  {"neovim/nvim-lspconfig",
    config = function()
      return require "configs.lspconfig"
      -- require("nvchad.configs.lspconfig")
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

  {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = false,
    -- ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter"
    },
    opts = {
      workspaces = {
        {
          name = "myobsi",
          path = "~/Documents/myobsi",
          overrides = {
            daily_notes = {
              -- Optional, if you keep daily notes in a separate directory.
              folder = "01_journal/2024",
              -- Optional, if you want to change the date format for the ID of daily notes.
              date_format = "%Y-%m-%d",
              -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
              template = "templates/daily_template"
            },

            templates = {
              folder = "templates",
            },

            disable_frontmatter = true,
          }
        },
      },

      -- see below for full list of options 👇
      mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- Toggle check-boxes.
        -- ["<leader>ch"] = {
        --   action = function()
        --     return require("obsidian").util.toggle_checkbox()
        --   end,
        --   opts = { buffer = true },
        -- },
        -- Smart action depending on context, either follow link or toggle checkbox.
        ["<cr>"] = {
          action = function()
            return require("obsidian").util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        }
      },
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      },

    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },

        background_colour = "#000000",
      })
    end,
  },


}
