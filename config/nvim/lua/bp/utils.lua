local bp_utils = {}

function bp_utils.define_augroups(definitions) -- {{{1
    -- Create autocommand groups based on the passed definitions
    --
    -- The key will be the name of the group, and each definition
    -- within the group should have:
    --    1. Trigger
    --    2. Pattern
    --    3. Text
    -- just like how they would normally be defined from Vim itself
    for group_name, definition in pairs(definitions) do
        vim.cmd('augroup ' .. group_name)
        vim.cmd('autocmd!')

        for _, def in pairs(definition) do
            local command = table.concat(vim.tbl_flatten {'autocmd', def}, ' ')
            vim.cmd(command)
        end

        vim.cmd('augroup END')
    end
end

-- lsp

function bp_utils.add_to_workspace_folder()
    vim.lsp.buf.add_workspace_folder()
end

function bp_utils.clear_references()
    vim.lsp.buf.clear_references()
end

function bp_utils.code_action()
    vim.lsp.buf.code_action()
end

function bp_utils.declaration()
    vim.lsp.buf.declaration()
    vim.lsp.buf.clear_references()
end

function bp_utils.definition()
    vim.lsp.buf.definition()
    vim.lsp.buf.clear_references()
end

function bp_utils.document_highlight()
    vim.lsp.buf.document_highlight()
end

function bp_utils.document_symbol()
    vim.lsp.buf.document_symbol()
end

function bp_utils.formatting()
    vim.lsp.buf.formatting()
end

function bp_utils.formatting_sync()
    vim.lsp.buf.formatting_sync()
end

function bp_utils.hover()
    vim.lsp.buf.hover()
end

function bp_utils.implementation()
    vim.lsp.buf.implementation()
end

function bp_utils.incoming_calls()
    vim.lsp.buf.incoming_calls()
end

function bp_utils.list_workspace_folders()
    vim.lsp.buf.list_workspace_folders()
end

function bp_utils.outgoing_calls()
    vim.lsp.buf.outgoing_calls()
end

function bp_utils.range_code_action()
    vim.lsp.buf.range_code_action()
end

function bp_utils.range_formatting()
    vim.lsp.buf.range_formatting()
end

function bp_utils.references()
    vim.lsp.buf.references()
    vim.lsp.buf.clear_references()
end

function bp_utils.remove_workspace_folder()
    vim.lsp.buf.remove_workspace_folder()
end

function bp_utils.rename()
    vim.lsp.buf.rename()
end

function bp_utils.signature_help()
    vim.lsp.buf.signature_help()
end

function bp_utils.type_definition()
    vim.lsp.buf.type_definition()
end

function bp_utils.workspace_symbol()
    vim.lsp.buf.workspace_symbol()
end

-- diagnostic

function bp_utils.get_all()
    vim.lsp.diagnostic.get_all()
end

function bp_utils.get_next()
    vim.lsp.diagnostic.get_next()
end

function bp_utils.get_prev()
    vim.lsp.diagnostic.get_prev()
end

function bp_utils.goto_next()
    vim.lsp.diagnostic.goto_next()
end

function bp_utils.goto_prev()
    vim.lsp.diagnostic.goto_prev()
end

function bp_utils.show_line_diagnostics()
    vim.lsp.diagnostic.show_line_diagnostics()
end

-- git signs

function bp_utils.next_hunk()
    require('gitsigns').next_hunk()
end

function bp_utils.prev_hunk()
    require('gitsigns').prev_hunk()
end

function bp_utils.stage_hunk()
    require('gitsigns').stage_hunk()
end

function bp_utils.undo_stage_hunk()
    require('gitsigns').undo_stage_hunk()
end

function bp_utils.reset_hunk()
    require('gitsigns').reset_hunk()
end

function bp_utils.reset_buffer()
    require('gitsigns').reset_buffer()
end

function bp_utils.preview_hunk()
    require('gitsigns').preview_hunk()
end

function bp_utils.blame_line()
    require('gitsigns').blame_line()
end

-- misc
function bp_utils.file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

return bp_utils
