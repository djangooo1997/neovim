local packer = require("packer")
packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use "akinsho/toggleterm.nvim"
    -- UI
    -- use {
    --     "goolord/alpha-nvim", -- welcome page
    --     config = function ()
    --      require'alpha'.setup(require'alpha.themes.dashboard'.config)
    --    end
    -- }
    use {
        "startup-nvim/startup.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require "startup".setup()
        end
    }
    use "kyazdani42/nvim-web-devicons" -- icons
    --    use({
    --   'projekt0n/github-nvim-theme',
    --   config = function()
    --     require('github-theme').setup({
    --       -- ...
    --     })
    --   end
    -- })
    vim.cmd.colorscheme "catppuccin"
    use { "catppuccin/nvim", as = "catppuccin"
    }
    use {
        "kyazdani42/nvim-tree.lua"
    } -- file explore
    -- use { 'akinsho/bufferline.nvim', tag = "v3.*",
    --     requires = 'nvim-tree/nvim-web-devicons',
    --     config = function()
    --         vim.opt.termguicolors = true
    --         require("bufferline").setup {}
    --     end
    -- } -- use "moll/vim-bbye"
    use { 'romgrk/barbar.nvim', wants = 'nvim-web-devicons' }
    -- use 'nvim-lua/lsp-status.nvim'

    -- use {
    --     "nvim-lualine/lualine.nvim", opt = true,
    --     config = function()
    --         require('lualine').setup {
    --             options = { theme = 'gruvbox' }
    --         }
    --     end
    -- } -- status line
    use {
        'ojroques/nvim-hardline',
        config = function()
            require('hardline').setup {}
        end
    }
    use "kevinhwang91/nvim-bqf" -- better quick fix

    -- Telescope
    use {
        "nvim-telescope/telescope-live-grep-args.nvim",
        commit = "9f62ecc6f6282e65adedaa3a0f18daea05664e64"
    }
    use {
        "nvim-telescope/telescope.nvim",
        tag = "nvim-0.6",
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }

    -- use {
    --   "nvim-telescope/telescope-frecency.nvim",
    --   requires = {"tami5/sqlite.lua"}   -- NOTE: need to install sqlite lib
    -- }
    use "nvim-telescope/telescope-ui-select.nvim"
    use "nvim-telescope/telescope-rg.nvim"
    -- use "MattesGroeger/vim-bookmarks"
    -- use "tom-anders/telescope-vim-bookmarks.nvim"
    use "nvim-telescope/telescope-dap.nvim"

    -- Treesittetr
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        commit = "44b7c8100269161e20d585f24bce322f6dcdf8d2",
    }

    -- LSP
    use "ravenxrz/neovim-cmake"
    -- use "Shatur/neovim-cmake"
    use "ravenxrz/vim-local-history"
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use { "glepnir/lspsaga.nvim" }

    -- Editor enhance
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {}
        end
    }

    use {
        "hrsh7th/nvim-cmp",
        -- commit = "4f1358e659d51c69055ac935e618b684cf4f1429",
    } -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"

    use "folke/which-key.nvim" -- which  key

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine

    -- Debugger
    use "ravenxrz/DAPInstall.nvim" -- help us install several debuggers
    use {
        "ravenxrz/nvim-dap",
        -- commit = "f9480362549e2b50a8616fe4530deaabbc4f889b",
    }
    use "theHamsta/nvim-dap-virtual-text"
    use "rcarriga/nvim-dap-ui"
    -- use "mfussenegger/nvim-dap-python"    -- debug python
    -- use { "leoluz/nvim-dap-go", module = "dap-go" } -- debug golang
    use { "jbyuki/one-small-step-for-vimkind", module = "osv" } -- debug any Lua code running in a Neovim instance
    use {
        "ravenxrz/nvim-gdb",
        run = "./install.sh"
    }
    use "ravenxrz/vim-local-history"

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    -- markdown
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

end)
