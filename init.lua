-- Enable faster startup by caching compiled Lua modules
vim.loader.enable()

-- OPTIONS
do
    -- Set <Space> as the leader key
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "
    vim.keymap.set("n", "<Space>", "<Nop>")

    -- Make line numbers default
    vim.o.number = true
    vim.o.relativenumber = true

    -- Enable mouse in all modes
    vim.o.mouse = "a"

    -- Don't show the mode, since it's already in the status line
    vim.o.showmode = false

    -- Sync clipboard between OS and Neovim
    vim.schedule(function()
        vim.o.clipboard = "unnamedplus"
    end)

    -- Enable break indent
    vim.o.breakindent = true

    -- Enable undo/redo changes even after closing and reopening a file
    vim.o.undofile = true

    -- Smart case search
    vim.o.ignorecase = true
    vim.o.smartcase = true

    -- Keep signcolumn on by default
    vim.o.signcolumn = "yes"

    -- Decrease update time
    vim.o.updatetime = 250

    -- Automatically update files when changed externally
    vim.o.autoread = true

    -- Decrease mapped sequence wait time
    vim.o.timeoutlen = 300

    -- Configure how new splits should be opened
    vim.o.splitright = true
    vim.o.splitbelow = true

    -- Configures how neovim will display certain whitespace characters in the editor
    vim.o.list = true
    vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

    -- Preview substitutions live
    vim.o.inccommand = "split"

    -- Show which line the cursor is on
    vim.o.cursorline = true

    -- Show rulers
    vim.opt.colorcolumn = { 80, 100, 120 }

    -- Minimum lines to show above and below the cursor
    vim.o.scrolloff = 5

    -- If performing an operation that would fail due to unsaved changes in the buffer, raise a dialog asking if you wish to save the current file(s)
    vim.o.confirm = true
end

-- DIAGNOSTICS
do
    vim.diagnostic.config {
        update_in_insert = false,
        severity_sort = true,
        float = { border = "rounded", source = "if_many" },
        underline = { severity = { min = vim.diagnostic.severity.WARN } },

        -- Show diagnostics in virtual lines
        virtual_text = true,
        virtual_lines = false,

        -- Auto open the float, to easily read the errors when jumping with `[d` and `]d`
        jump = {
            on_jump = function(_, bufnr)
                vim.diagnostic.open_float {
                    bufnr = bufnr,
                    scope = "cursor",
                    focus = false,
                    source = "if_many",
                }
            end,
        },
    }

    -- Toggle diagnostic virtual lines
    vim.keymap.set("n", "<Leader>tl", function()
        vim.diagnostic.config {
            virtual_lines = not vim.diagnostic.config().virtual_lines,
        }
    end, {
        silent = true,
        desc = "Toggle diagnostic virtual lines",
    })

    -- Open diagnostic list
    vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist, {
        silent = true,
        desc = "Open diagnostic list",
    })
end

-- GENERAL BINDINGS
do
    -- Clear highlights on search when pressing <Esc> in normal mode
    vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", {
        silent = true,
    })

    -- Open terminal
    vim.keymap.set("n", "<Leader>t", "<Cmd>terminal<CR>", {
        silent = true,
        desc = "Open terminal",
    })

    -- Exit terminal mode
    vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", {
        silent = true,
        desc = "Exit terminal mode",
    })

    -- Shortcuts for split navigation
    vim.keymap.set("n", "<C-h>", "<C-w><C-h>", {
        silent = true,
        desc = "Move focus to the left window",
    })
    vim.keymap.set("n", "<C-l>", "<C-w><C-l>", {
        silent = true,
        desc = "Move focus to the right window",
    })
    vim.keymap.set("n", "<C-j>", "<C-w><C-j>", {
        silent = true,
        desc = "Move focus to the lower window",
    })
    vim.keymap.set("n", "<C-k>", "<C-w><C-k>", {
        silent = true,
        desc = "Move focus to the upper window",
    })

    -- Focus tab
    for i = 1, 10 do
        local k = i % 10
        vim.keymap.set("n", "<A-" .. k .. ">", i .. "gt", {
            silent = true,
            desc = "Focus tab " .. i,
        })
    end

    -- Keep cursor position when joining lines
    vim.keymap.set("n", "J", function()
        local pos = vim.api.nvim_win_get_cursor(0)
        vim.cmd.normal { "J", bang = true }
        vim.api.nvim_win_set_cursor(0, pos)
    end, {
        silent = true,
        desc = "Join lines while keeping the cursor position",
    })

    -- Keep selection while changing indentation
    vim.keymap.set("v", ">", ">gv", {
        silent = true,
        desc = "Indent while keeping selection",
    })
    vim.keymap.set("v", "<", "<gv", {
        silent = true,
        desc = "Dedent while keeping selection",
    })
end

-- GRAPHICAL INTERFACE
do
    if vim.g.neovide then
        -- Font
        vim.o.guifont = "monospace"

        -- Scale
        vim.keymap.set("n", "<C-=>", function()
            vim.g.neovide_scale_factor = math.min(vim.g.neovide_scale_factor + 0.1, 2)
        end, {
            silent = true,
            desc = "Increase scale factor",
        })
        vim.keymap.set("n", "<C-->", function()
            vim.g.neovide_scale_factor = math.max(vim.g.neovide_scale_factor - 0.1, 0.1)
        end, {
            silent = true,
            desc = "Decrease scale factor",
        })

        -- Opacity
        vim.g.neovide_normal_opacity = 0.95
        vim.keymap.set("n", "<C-+>", function()
            vim.g.neovide_normal_opacity = math.min(vim.g.neovide_normal_opacity + 0.05, 1.0)
        end, {
            silent = true,
            desc = "Increase opacity",
        })
        vim.keymap.set("n", "<C-_>", function()
            vim.g.neovide_normal_opacity = math.max(vim.g.neovide_normal_opacity - 0.05, 0.0)
        end, {
            silent = true,
            desc = "Decrease opacity",
        })

        -- Padding around the editor
        vim.g.neovide_padding_top = 10
        vim.g.neovide_padding_bottom = 10
        vim.g.neovide_padding_left = 10
        vim.g.neovide_padding_right = 10

        -- Cursor animation
        vim.g.neovide_cursor_animation_length = 0.02
        vim.g.neovide_cursor_trail_size = 0.2

        -- Cursor particles
        vim.g.neovide_cursor_vfx_mode = ""

        -- Scroll animation
        vim.g.neovide_scroll_animation_length = 0.10

        -- Toggle fullscreen
        vim.keymap.set("n", "<F11>", function()
            vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
        end)
    end
end

-- AUTOCOMMANDS
do
    -- Highlight when yanking (copying) text
    vim.api.nvim_create_autocmd("TextYankPost", {
        desc = "Highlight when yanking text",
        group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
        callback = function()
            vim.hl.on_yank()
        end,
    })
end

-- ENHANCEMENTS
do
    require("guess-indent").setup()

    -- Modus theme
    require("modus-themes").setup {
        style = "modus_vivendi",
        variants = {
            modus_operandi = "default",
            modus_vivendi = "default",
        },
    }
    vim.cmd.colorscheme "modus"

    require("mini.move").setup()
    require("mini.surround").setup()
    require("mini.ai").setup()
    require("mini.statusline").setup { use_icons = false }
    require("mini.diff").setup()
    require("mini.git").setup()
    require("mini.pick").setup()

    vim.keymap.set("n", "<Leader><Leader>", "<Cmd>Pick files<CR>", {
        silent = true,
        desc = "Pick files",
    })
    vim.keymap.set("n", "<Leader>/", "<Cmd>Pick grep_live<CR>", {
        silent = true,
        desc = "Grep",
    })
    vim.keymap.set("n", "<Leader>b", "<Cmd>Pick buffers<CR>", {
        silent = true,
        desc = "Pick buffers",
    })
    vim.keymap.set("n", "<Leader>h", "<Cmd>Pick help<CR>", {
        silent = true,
        desc = "Pick help",
    })

    require("oil").setup()
end

-- LANGUAGE SERVER PROTOCOL
do
    -- Server status updates
    require("fidget").setup {}

    --  Run this when a server attaches to a particular buffer.
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach-setup", { clear = true }),
        callback = function(event)
            -- Rename the variable under the cursor
            vim.keymap.set("n", "grn", vim.lsp.buf.rename, {
                silent = true,
                desc = "Rename",
            })

            -- Execute a code action, usually the cursor needs to be on top of an error or a suggestion from the language server for this to activate
            vim.keymap.set({ "n", "x" }, "gra", vim.lsp.buf.code_action, {
                silent = true,
                desc = "Go to code action",
            })

            -- Go to declaration
            vim.keymap.set("n", "grD", vim.lsp.buf.declaration, {
                silent = true,
                desc = "Goto declaration",
            })

            -- Toggle inlay hints in the code, if the language server supports them
            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client and client:supports_method("textDocument/inlayHint", event.buf) then
                vim.keymap.set("n", "<Leader>th", function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }, {
                        bufnr = event.buf,
                    })
                end, {
                    silent = true,
                    desc = "Toggle inlay hints",
                })
            end
        end,
    })

    vim.lsp.enable {
        "clangd",
        "dart",
        "gopls",
        "jdtls",
        "kotlin_language_server",
        "lua_ls",
        "nil_ls",
        "ty",
        "ruff",
        "rust_analyzer",
        "zls",
        "ts_ls",
        "bashls",
        "fish_lsp",
        "emmet_ls",
        "html",
        "cssls",
        "jsonls",
        "eslint",
        "marksman",
        "tinymist",
        "yamlls",
        "taplo",
    }
end

-- FORMATTING
do
    require("conform").setup {
        notify_on_error = false,
        format_on_save = function()
            return { timeout_ms = 500 }
        end,
        default_format_opts = {
            lsp_format = "fallback",
        },
    }

    vim.keymap.set({ "n", "v" }, "<Leader>df", function()
        require("conform").format { async = true }
    end, {
        silent = true,
        desc = "Format buffer",
    })
end

-- AUTOCOMPLETE & SNIPPETS
do
    -- Luasnip
    local luasnip = require "luasnip"
    luasnip.setup {}

    -- Cmp
    local cmp = require "cmp"
    cmp.setup {
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<CR>"] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            },
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<C-j>"] = cmp.mapping.select_next_item(),
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-e>"] = cmp.mapping.abort(),
        },
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
        }, {
            { name = "buffer" },
        }),
    }
    cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer" },
        },
    })
    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),

        sources = cmp.config.sources({
            { name = "path" },
        }, {
            { name = "cmdline" },
        }),

        matching = {
            disallow_symbol_nonprefix_matching = false,
        },
    })
    -- Set capabilities
    vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })
end
