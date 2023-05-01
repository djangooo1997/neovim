local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

-- FileExpoler
map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)

map("n", "<leader>]", ":nohlsearch<CR>", opt)
-- 关闭当前
-- map("n", "sc", "<C-w>c", opt)

-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)
-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- 上下滚动浏览
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
local pluginKeys = {}
-- lsp 回调函数快捷键设置
-- pluginKeys.mapLSP = function(mapbuf)
--     -- rename
--     mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
--     -- code action
--     mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
--     -- go xx
--     mapbuf("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opt)
--     mapbuf("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opt)
--     mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
--     mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
--     mapbuf("n", "gr", "<cmd>Lspsaga rename<CR>", opt)
--     -- diagnostic
--     mapbuf("n", "go", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
--     mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
--     mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
--     mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
--     -- 没用到
--     -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
--     -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
--     -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
--     -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
--     -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
--     -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
-- end

-- 列表快捷键
pluginKeys.nvimTreeList = { -- 打开文件或文件夹
    { key = { "o", "<2-LeftMouse>" }, action = "edit" },
    { key = "<CR>", action = "system_open" },
    -- v分屏打开文件
    { key = "v", action = "vsplit" },
    -- h分屏打开文件
    { key = "h", action = "split" },
    -- Ignore (node_modules)
    { key = "i", action = "toggle_ignored" },
    -- Hide (dotfiles)
    { key = ".", action = "toggle_dotfiles" },
    { key = "R", action = "refresh" },
    -- 文件操作
    { key = "a", action = "create" },
    { key = "d", action = "remove" },
    { key = "r", action = "rename" },
    { key = "x", action = "cut" },
    { key = "c", action = "copy" },
    { key = "p", action = "paste" },
    { key = "y", action = "copy_name" },
    { key = "Y", action = "copy_path" },
    { key = "gy", action = "copy_absolute_path" },
    { key = "I", action = "toggle_file_info" },
    { key = "n", action = "tabnew" },
    -- 进入下一级
    { key = { "]" }, action = "cd" },
    -- 进入上一级
    { key = { "[" }, action = "dir_up" },
}


-- bufferline
-- 左右Tab切换
map("n", "<C-h>", ":BufferPrevious<CR>", opt)
map("n", "<C-l>", ":BufferNext<CR>", opt)
-- -- "moll/vim-bbye" 关闭当前 buffer
map("n", "<C-w>", ":BufferClose<CR>", opt)
-- -- map("n", "<leader>bc", ":Bdelete!<CR>", opt)
-- map("n", "<A-w>", ":Bdelete!<CR>", opt)
-- -- 关闭左/右侧标签页
-- map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
-- map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
-- -- 关闭其他标签页
-- map("n", "<leader>bo", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)
-- -- 关闭选中标签页
-- map("n", "<leader>bp", ":BufferLinePickClose<CR>", opt)
-- 跳转标签
map("n", "<A-1>", ":BufferGoto 1<CR>", opt)
map("n", "<A-2>", ":BufferGoto 2<CR>", opt)
map("n", "<A-3>", ":BufferGoto 3<CR>", opt)
map("n", "<A-4>", ":BufferGoto 4<CR>", opt)
map("n", "<A-5>", ":BufferGoto 5<CR>", opt)
map("n", "<A-6>", ":BufferGoto 6<CR>", opt)
map("n", "<A-7>", ":BufferGoto 7<CR>", opt)
map("n", "<A-8>", ":BufferGoto 8<CR>", opt)
map("n", "<A-9>", ":BufferGoto 9<CR>", opt)


-- 代码注释插件
-- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
    -- Normal 模式快捷键
    toggler = {
        line = "gcc", -- 行注释
        block = "gbc", -- 块注释
    },
    -- Visual 模式
    opleader = {
        line = "gc",
        bock = "gb",
    },
}

-- debug
-- map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opt)
--
-- map("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", opt)
-- keymap("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", opts)
map("n", "<F9>", "<cmd>lua require'dap'.run_last()<cr>", opt)
map('n', '<F10>', '<cmd>lua require"user.dap.dap-util".reload_continue()<CR>', opt)
map("n", "<F4>", "<cmd>lua require'dap'.terminate()<cr>", opt)
map("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opt)
map("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", opt)
map("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opt)
map("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>", opt)
map("n", "K", "<cmd>lua require'dapui'.eval()<cr>", opt)
-- map("n", "<leader>dt", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- map("n", "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", opts)

return pluginKeys
