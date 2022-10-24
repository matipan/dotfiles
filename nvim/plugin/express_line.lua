local builtin = require "el.builtin"
local extensions = require "el.extensions"
local sections = require "el.sections"
local subscribe = require "el.subscribe"

vim.cmd[[
hi StatusLine ctermfg=8 ctermbg=6 guibg=#88C0D0 guifg=#4C566A
]]
--hi StatusLine guifg=#88c0d0 guibg=#4c566a

if false then
    -- Disappearing statusline for commands
    vim.opt.cmdheight = 0
    vim.api.nvim_create_autocmd("ModeChanged", {
        group = vim.api.nvim_create_augroup("StatusDisappear", { clear = true }),
        callback = function()
            if vim.v.event.new_mode == "c" then
                vim.opt.laststatus = 0
            elseif vim.v.event.old_mode == "c" then
                vim.opt.laststatus = 3
            end

            pcall(vim.cmd, [[silent! redraw]])
        end,
    })
end

local git_icon = subscribe.buf_autocmd("el_file_icon", "BufRead", function(_, bufnr)
    local icon = extensions.file_icon(_, bufnr)
    if icon then
        return icon .. " "
    end

    return ""
end)

local git_branch = subscribe.buf_autocmd("el_git_branch", "BufEnter", function(window, buffer)
    local branch = extensions.git_branch(window, buffer)
    if branch then
        return " " .. extensions.git_icon() .. " " .. branch
    end
end)

local git_changes = subscribe.buf_autocmd("el_git_changes", "BufWritePost", function(window, buffer)
    return extensions.git_changes(window, buffer)
end)

local generator = function()
    local mode = extensions.gen_mode { format_string = " %s " }

    local items = {
        { mode, required = true },
        { git_branch },
        { " " },
        { sections.split, required = true },
        { git_icon },
        { sections.maximum_width(builtin.file_relative, 0.60), required = true },
        { sections.collapse_builtin { { " " }, { builtin.modified_flag } } },
        { sections.split, required = true },
        { git_changes },
        { "[" },
        { builtin.line_with_width(3) },
        { ":" },
        { builtin.column_with_width(2) },
        { "]" },
        {
            sections.collapse_builtin {
                "[",
                builtin.help_list,
                builtin.readonly_list,
                "]",
            },
        },
    }

    local segments = {}
    for _, item in ipairs(items) do
        table.insert(segments, item)
    end

    return segments
end

require('el').setup { generator = generator }
