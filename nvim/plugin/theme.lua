require('nordic').colorscheme({
    underline_option = 'none',
    italic = false,
    italic_comments = true,
    minimal_mode = false,
    alternate_backgrounds = false
})

vim.o.termguicolors = true
vim.g.colors_name = "nordic"

vim.cmd[[
colorscheme nordic
hi StatusLine ctermfg=8 ctermbg=6 guibg=#88C0D0 guifg=#4C566A
hi Pmenu guibg=NONE
hi FloatBorder guifg=#e5e9f0
hi NormalFloat guibg=NONE
hi ElVisual gui=bold
hi ElNormal gui=bold guifg=#88C0D0
hi ElCommand gui=bold guifg=#88C0D0
hi ElInsert gui=bold ctermfg=8 ctermbg=6 guibg=#88C0D0 guifg=#4C566A
hi ElVisualLine gui=bold ctermfg=8 ctermbg=6 guibg=#88C0D0 guifg=#4C566A
hi ElVisualBlock gui=bold ctermfg=8 ctermbg=6 guibg=#88C0D0 guifg=#4C566A
]]
