local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("lsp.setup")
-- 和上面的配置二选一
-- require("user.lsp.lsp-config-manually")
require("lsp.handlers").setup()
-- require("user.lsp.null-ls")
-- require("user.lsp.lsp-utils")
