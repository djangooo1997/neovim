local M = {}
local dap = require("dap")
local dapui = require("dapui")
require("nvim-dap-virtual-text").setup({
    commented = true,
})

-- 定义各种图标
local dap_breakpoint_color = {
    breakpoint = {
        ctermbg = 0,
        fg = '#993939',
        bg = '#31353f',
    },
    logpoing = {
        ctermbg = 0,
        fg = '#61afef',
        bg = '#31353f',
    },
    stopped = {
        ctermbg = 0,
        fg = '#98c379',
        bg = '#31353f'
    },
}

vim.api.nvim_set_hl(0, 'DapBreakpoint', dap_breakpoint_color.breakpoint)
vim.api.nvim_set_hl(0, 'DapLogPoint', dap_breakpoint_color.logpoing)
vim.api.nvim_set_hl(0, 'DapStopped', dap_breakpoint_color.stopped)

local dap_breakpoint = {
    error = {
        text = "",
        texthl = "DapBreakpoint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
    },
    condition = {
        text = 'ﳁ',
        texthl = 'DapBreakpoint',
        linehl = 'DapBreakpoint',
        numhl = 'DapBreakpoint',
    },
    rejected = {
        text = "",
        texthl = "DapBreakpint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
    },
    logpoint = {
        text = '',
        texthl = 'DapLogPoint',
        linehl = 'DapLogPoint',
        numhl = 'DapLogPoint',
    },
    stopped = {
        text = '',
        texthl = 'DapStopped',
        linehl = 'DapStopped',
        numhl = 'DapStopped',
    },
}

vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
vim.fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
vim.fn.sign_define('DapLogPoint', dap_breakpoint.logpoint)
vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)

--
-- vim.fn.sign_define("DapBreakpoint", {
--     text = "🛑",
--     texthl = "LspDiagnosticsSignError",
--     linehl = "",
--     numhl = "",
-- })
--
-- vim.fn.sign_define("DapStopped", {
--     text = "",
--     texthl = "LspDiagnosticsSignInformation",
--     linehl = "DiagnosticUnderlineInfo",
--     numhl = "LspDiagnosticsSignInformation",
-- })
--
-- vim.fn.sign_define("DapBreakpointRejected", {
--     text = "",
--     texthl = "LspDiagnosticsSignHint",
--     linehl = "",
--     numhl = "",
-- })

dapui.setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "o", "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    layout = {
        { -- You can change the order of elements in the sidebar
            elements = {
                -- Provide as ID strings or tables with "id" and "size" keys
                {
                    id = "scopes",
                    size = 0.25, -- Can be float or integer > 1
                },
                { id = "breakpoints", size = 0.25 },
                { id = "stacks", size = 0.25 },
                { id = "watches", size = 00.25 },
            },
            size = 40,
            position = "left", -- Can be "left", "right", "top", "bottom"
        },
        {
            elements = { "repl" },
            size = 10,
            position = "bottom", -- Can be "left", "right", "top", "bottom"
        },
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil, -- Can be integer or nil.
    },
}) -- use default
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close({})
end

local function config_debuggers()
    -- TODO: wait dap-ui for fixing temrinal layout
    -- the "30" of "30vsplit: doesn't work
    -- dap.defaults.fallback.terminal_win_cmd = '30vsplit new' -- this will be overrided by dapui
    -- dap.set_log_level("DEBUG")

    -- load from json file
    require('dap.ext.vscode').load_launchjs(nil, { cppdbg = { 'cpp' } })
    -- config per launage
    -- require("user.dap.dap-cpp")
    -- require("user.dap.di-go")

    require("dap.nvim-dap.dap-cpp")
    -- require("dap.nvim-dap.di-cpp")
    -- require("user.dap.dap-go")
    -- require("user.dap.dap-python")
    -- require("user.dap.dap-lua")
    -- require("user.dap.dap-cpp")
    -- require("config.dap.python").setup()
    -- require("config.dap.rust").setup()
    -- require("config.dap.go").setup()
end

function M.setup()
    config_debuggers() -- Debugger
end

return M

-- 绑定 nvim-dap 快捷键
-- require("keybindings").mapDAP()
