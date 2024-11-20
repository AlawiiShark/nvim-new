return
  {
      {
          "williamboman/mason.nvim",
          opts = {
            ensure_installed = {
              "stylua",
              "shellcheck",
              "shfmt",
              "flake8",
            },
          },
      },

      {
          'akinsho/flutter-tools.nvim',
          lazy = false,
          dependencies = {
              'nvim-lua/plenary.nvim',
              'stevearc/dressing.nvim', -- optional for vim.ui.select
          },
          config = true,
      },
      {
      'kristijanhusak/vim-dadbod-ui',
      dependencies = {
        { 'tpope/vim-dadbod', lazy = true },
        { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
      },
      cmd = {
        'DBUI',
        'DBUIToggle',
        'DBUIAddConnection',
        'DBUIFindBuffer',
      },
      init = function()
        -- Your DBUI configuration
        vim.g.db_ui_use_nerd_fonts = 1
      end,
    },
    {
      "folke/drop.nvim",
      event = "VeryLazy",
      config = function()
        require("drop").setup({
          --- name of the global variable which holds the main drop instance
          global_name = "drop",
          --- don't create mappings
          disable_mappings = false,
          --- theme to use for the drops
          theme = "stars", -- can be "stars", "snow", or "spring"
          --- max number of drops on the screen
          max = 40,
          --- interval for spawning a new drop
          interval = 150,
          --- probability for a drop to show
          probability = 0.6,
          --- fold columns when there are drops on the screen
          fold_columns = false,
          --- automatically start drop when opened
          automatic = true,
        })
      end,
    },
    -- Add SuperMaven plugin
    {
      "supermaven-inc/supermaven-nvim",
      config = function()
        require("supermaven-nvim").setup({
          keymaps = {
            accept_suggestion = "<A-l>",
            clear_suggestion = "<A-h>",
            accept_word = "<A-j>",
          },
          ignore_filetypes = { cpp = true },
          color = {
            suggestion_color = "#ffffff",
            cterm = 244,
          },
          log_level = "info", -- set to "off" to disable logging completely
          disable_inline_completion = false, -- disables inline completion for use with cmp
          disable_keymaps = false -- disables built in keymaps for more manual control
        })
      end,
    },
    {'romgrk/barbar.nvim',
      dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
      },
      init = function() vim.g.barbar_auto_setup = false end,
      opts = {
        animation = true,
        insert_at_start = true,
      },
    },
    {
      "yetone/avante.nvim",
        event = "InsertEnter", -- Load only when entering insert mode
        lazy = true,          -- Enable lazy loading
        version = "*",        -- Use latest stable version
        opts = {
          providers = {
            -- Configure which AI providers to use
            copilot = true,   -- Enable GitHub Copilot integration
            codeium = false,  -- Disable Codeium by default
          },
          ui = {
            floating = {
              border = "rounded",     -- Use rounded borders for floating windows
              max_height = 0.6,       -- Maximum height of floating windows (60% of screen)
              max_width = 0.4,        -- Maximum width of floating windows (40% of screen)
            },
            completion = {
              auto_trigger = true,    -- Enable auto-triggering of completions
              trigger_characters = {}, -- Characters that trigger completion
            },
          },
          suggestion = {
            auto_trigger = true,      -- Enable automatic suggestions
            debounce = 75,           -- Debounce time in milliseconds
            keymap = {
              accept = "<Tab>",      -- Key to accept suggestions
              next = "<C-n>",        -- Key to go to next suggestion
              prev = "<C-p>",        -- Key to go to previous suggestion
              dismiss = "<C-e>",     -- Key to dismiss suggestions
            },
          },
          telemetry = false,         -- Disable telemetry for privacy
        },
        build = "make",
        dependencies = {
          "stevearc/dressing.nvim",
          "nvim-lua/plenary.nvim",
          "MunifTanjim/nui.nvim",
          "nvim-tree/nvim-web-devicons",
          "zbirenbaum/copilot.lua",
          {
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
              default = {
                embed_image_as_base64 = false,
                prompt_for_file_name = false,
                drag_and_drop = {
                  insert_mode = true,
                },
                use_absolute_path = true,
              },
            },
          },
        },
      },
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        opt = true,  -- Mark as optional
        after = 'nvim-treesitter', -- Load after the core treesitter plugin
        config = function()
        end,
      },
      {
          'MeanderingProgrammer/render-markdown.nvim',
          dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
          -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
          -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
          ---@module 'render-markdown'
          ---@type render.md.UserConfig
          opts = {},
      },
      {
        "frankroeder/parrot.nvim",
        dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
        -- optionally include "rcarriga/nvim-notify" for beautiful notifications
        config = function()
          require("parrot").setup {
            -- Providers must be explicitly added to make them available.
            providers = {
              anthropic = {
                api_key = os.getenv "ANTHROPIC_API_KEY",
              },
              gemini = {
                api_key = os.getenv "GEMINI_API_KEY",
              },
              groq = {
                api_key = os.getenv "GROQ_API_KEY",
              },
              mistral = {
                api_key = os.getenv "MISTRAL_API_KEY",
              },
              pplx = {
                api_key = os.getenv "PERPLEXITY_API_KEY",
              },
              -- provide an empty list to make provider available (no API key required)
              ollama = {},
              openai = {
                api_key = os.getenv "OPENAI_API_KEY",
              },
              github = {
                api_key = os.getenv "GITHUB_TOKEN",
              },
              nvidia = {
                api_key = os.getenv "NVIDIA_API_KEY",
              },
              xai = {
                api_key = os.getenv "XAI_API_KEY",
              },
            },
          }
        end,
      }
}
