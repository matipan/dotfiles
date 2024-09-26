vim.g.nord_contrast = false
vim.g.nord_borders = false
vim.g.nord_disable_background = false
vim.g.nord_italic = false
vim.g.nord_uniform_diff_background = false
vim.g.nord_bold = false

vim.o.termguicolors = true
vim.cmd.colorscheme "tokyonight-storm"

-- 88C0D0
vim.cmd[[
hi StatusLine ctermfg=8 ctermbg=6 guibg=#41a6b5 guifg=#2e2c2c
hi ElVisual gui=bold
hi ElNormal gui=bold guifg=#41a6b5
hi ElCommand gui=bold guifg=#41a6b5
hi ElInsert gui=bold ctermfg=8 ctermbg=6 guibg=#41a6b5 guifg=#2e2c2c
hi ElVisualLine gui=bold ctermfg=8 ctermbg=6 guibg=#41a6b5 guifg=#2e2c2c
hi ElVisualBlock gui=bold ctermfg=8 ctermbg=6 guibg=#41a6b5 guifg=#2e2c2c
hi Pmenu guibg=NONE
hi NormalFloat guibg=NONE
hi FloatBorder guibg=NONE
hi ColorColumn guibg=#292e42
"hi MyFunction gui=italic guifg=#88c0d0
"hi MyBuiltin guifg=#8FBCBB
"hi MyFunc guifg=#88c0d0
"hi MyKeyword guifg=#5e81ac
]]
