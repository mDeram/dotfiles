local function on_attach()

end

require'lspconfig'.tsserver.setup{ on_attach=on_attach,
    init_options = {
        hostInfo = "neovim",
        preferences = {
            importModuleSpecifierPreference = "non-relative"
        }
    }
}
--[[

settings = {
    tsserver = {
        importModuleSpecifierPreference = "project-relative"
    }
}

--]]
vim.api.nvim_set_keymap('n', '<leader>w', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', { noremap=true, silent=true })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.bashls.setup{ on_attach=on_attach }
require'lspconfig'.tailwindcss.setup{ on_attach=on_attach }
require'lspconfig'.rust_analyzer.setup{ on_attach=on_attach }
require'lspconfig'.dockerls.setup{ on_attach=on_attach }
require'lspconfig'.graphql.setup{ on_attach=on_attach }
require'lspconfig'.cssmodules_ls.setup{ on_attach=on_attach }
require'lspconfig'.cssls.setup{ capabilities=capabilities }
--[[require'lspconfig'.zeta_note.setup{
    cmd = { '/home/matutu/.local/bin/zeta-note' }
}]]
require'lspconfig'.gopls.setup{}



-- Support for Tab, S-Tab
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  else
    return t "<Tab>"
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return vim.fn['compe#complete']()
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
