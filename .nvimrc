" .nvimrc configuration by Matias Pan - <matias.pan26@gmail.com>
" Github account: https://github.com/kriox26
"=======================================================================
"     Index
" 1 -- Vim-plug
" 2 -- General settings
" 3 -- Graphical configs
" 4 -- Search configs
" 5 -- Statusbar
" 6 -- Helpers and functions
" 7 -- Navigation keymaps
" 8 -- Other keymaps and abbrev
" 9 -- Plugins configs
"
"=========================================================
"         Vim-plug 					 "
"=========================================================

" Vim-plug list of plugins - {{{
filetype off
call plug#begin('~/Documents/dotfiles/.nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'jodosha/vim-godebug'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/syntastic'
Plug 'fatih/vim-go'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'mattn/gist-vim'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'Yggdroot/indentLine'
Plug 'janko-m/vim-test'
Plug 'terryma/vim-multiple-cursors'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'
Plug 'Shougo/neoyank.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mattn/webapi-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'keith/rspec.vim'
Plug 'vimlab/split-term.vim'
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'Shougo/denite.nvim', { 'do': function('DoRemote') }

call plug#end()
" }}}

"=========================================================
"         General settings           "
"=========================================================

" Enable pipe shape cursor when in insert mode
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

"Map leader key to -
  let mapleader = "-"

"Open your .nvimrc with this key map
  nnoremap <leader>en :vsplit $MYVIMRC<return>

"Basic configs
  set number
  set hidden
  " set relativenumber
  " Workaround for the clumsy redraw with relativenumber
  " set lazyredraw
  "Reduce timeout after <ESC> is pressed
  set ttimeout
  set ttimeoutlen=20
  set notimeout
  set backspace=indent,eol,start
  set completeopt=menuone
  set nobackup
  set noswapfile
  set scrolljump=20

"Set tab indent, 2 spaces
  set autoindent
  set smartindent
  set softtabstop=0
  set tabstop=8
  set shiftwidth=8
  set expandtab
  set smarttab
  filetype on
  filetype plugin indent on
  set inccommand=split


" Autocmd sections for specific filetypes and buffer events -------- {{{
" Only do this part when compiled with support for autocommands.
  if has("autocmd")
    " Enable file type detection.
    syntax enable
    " Also load indent files, to automatically do language-dependent indenting.
    augroup filetypes
      autocmd!
      autocmd FileType text setlocal textwidth=500
      autocmd FileType c setlocal tabstop=8|setlocal shiftwidth=8
      "autocmd FileType markdown setlocal spell
      autocmd FileType vim setlocal foldmethod=marker
    augroup END
    augroup markdownb
      autocmd!
      "for changing headings when editing markdown files
    augroup END
    augroup sourcing_and_buffers
      autocmd!
      "Source .nvimrc after writing it, reloads nvim
      autocmd BufWritePost .nvimrc source %
      au! BufNewFile,BufRead *.applescript   setf applescript
      autocmd BufRead,BufNewFile *.scss set filetype=scss.css
      autocmd BufNewFile,BufRead *.json set ft=javascript
      autocmd BufRead,BufNewFile *.rb setlocal tabstop=2|setlocal shiftwidth=2
      autocmd BufRead,BufNewFile *.yml setlocal tabstop=2|setlocal shiftwidth=2
      autocmd BufRead,BufNewFile *.html setlocal tabstop=4|setlocal shiftwidth=4
      autocmd BufRead,BufNewFile *.tmpl setlocal tabstop=4|setlocal shiftwidth=4
      autocmd BufRead,BufNewFile *.js,*.jsx setlocal tabstop=4|setlocal shiftwidth=4
      autocmd BufNewFile,BufRead *.mote set syntax=html
      autocmd BufNewFile,BufRead *.pas,*.pascal set syntax=pascal|setlocal shiftwidth=4|setlocal tabstop=4
      "Change the PWD of current window to the dir of currently opened file, only if the file is not in a /tmp folder
      " autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
	  " jump to last known position of each buf
      autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
    augroup END
  endif " has("autocmd")
" }}}

"=========================================================
"         Graphical configs          "
"=========================================================

" colorscheme hlsearch ---- {{{
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
  if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
  endif

  if (has("termguicolors"))
    set termguicolors
  endif
  set background=dark
  colorscheme deep-space
  let g:deepspace_italics = 1

" }}}

"=========================================================
"         Search configs             "
"=========================================================

" do incremental searching
  set incsearch

"Ag global configs, ctrlp also --- {{{

"PyMatcher for CtrlP
  if has("python")
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
  endif

"Ag for searching files
  if executable('ag')
    "Use ag over grep
    set grepprg=ag\ --nogroup
    let g:grep_cmd_opts = '--line-numbers --noheading'
    " let g:ctrlp_user_command = 'ag %s -l -g \""'
    "Use ag in CtrlP for listing files. Faster than grep and respects
    ".gitignore
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --ignore ''log'' --hidden -g ""'
  endif

"bind K to search word under cursor
  nnoremap <leader>K :Ag! <C-R><C-W><CR>

" Do not clear filenames cache, to improve CtrlP startup
" You can manualy clear it by <F5>
  let g:ctrlp_clear_cache_on_exit = 0
  let g:ctrlp_max_files = 0
  let g:ctrlp_max_height =  25
  let g:ctrlp_match_window = 'results:100' " overcome limit imposed by max height
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|log)$',
    \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
     \}
  " Use the nearest .git directory as the cwd
  let g:ctrlp_working_path_mode = 'ra'
  nnoremap <leader>. :CtrlPTag<cr>

"This makes CtrlP faster
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" }}}

"=========================================================
"         Statusbar config           "
"=========================================================

"Always show statusline
  set laststatus=2

"Airline and syntastic global variables setup ------------------ {{{
"airline configurations
  let g:airline_powerline_fonts = 1
  let g:airline_theme = 'deep_space'
  let g:airline#extensions#tabline#enabled=0 "Show line of opened buffers at top of screen
  let g:airline#extensions#syntastic#enabled = 1  "Enable syntastic
  let g:airline#extensions#whitespace#enabled = 0
  let g:airline_detect_syntastic=1  "set the syntastic error message on statusline
  let g:syntastic_enable_signs=1      "Enable signs for syntastic
  let g:syntastic_always_populate_loc_list=1 "For using :lopen or :lwindow
  let g:syntastic_auto_jump=1
  let g:syntastic_error_symbol = "✗"
  let g:syntastic_warning_symbol = "⚠ "
  nnoremap <leader>slc :lclose<return>
  nnoremap <leader>sll :lopen<return>

"set syntastic mode active at startup with certain fyletype
    let g:syntastic_mode_map = { "mode": "active",
                               \ "active_filetypes": ["php","c","javascript","cpp","go","python", "ruby", "scss", "coffe"],
                               \ "passive_filetypes": ["erb", "java","html"] }
" }}}

"=========================================================
"         Functions and helpers        "
"=========================================================

"functions to show highligting groups for current word, underline current line, and bring a shell command output to a buffer - {{{
"Show highlighting groups for current word with leader + f + s, usefull when having miss syntax highlight
  nmap <leader>hg :call <SID>SynStack()<CR>
  function! <SID>SynStack()
    if !exists("*synstack")
      return
    endif
    echo map(synstack(line('.'),col('.')),'synIDattr(v:val, "name")')
  endfunc

"Underlines current line with =, ", or *
  function! s:Underline(chars)
    let chars = empty(a:chars) ? '=' : a:chars
    let nr_columns = virtcol('$') - 1
    let uline = repeat(chars, (nr_columns / len(chars)) + 1)
    put =strpart(uline, 0, nr_columns)
  endfunction
  command! -nargs=? Underline call s:Underline(<q-args>)
  nnoremap <leader>u= :Underline =<return>
  nnoremap <leader>u" :Underline "<return>
  nnoremap <leader>u* :Underline *<return>
  nnoremap <leader>u- :Underline -<return>
  nnoremap <leader>u# :Underline #<return>

" Command for openning a buffer with the output of a shell command, such as ls or ruby myprogram.rb" --
  command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
  function! s:RunShellCommand(cmdline)
    echo a:cmdline
    let expanded_cmdline = a:cmdline
    for part in split(a:cmdline, ' ')
      if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
      endif
    endfor
    botright new
    setlocal bufhidden=wipe nobuflisted noswapfile nowrap "remove the buftype=file so that you can save the buffer into a file
    call setline(1, 'You entered:    ' . a:cmdline)
    call setline(2, 'Expanded From:  ' .expanded_cmdline)
    call setline(3,substitute(getline(2),'.','=','g'))
    execute '$read !'. expanded_cmdline
    "setlocal nomodifiable
    1
  endfunction
  "Set leader + rc to run the ruby program in current buffer
  nnoremap <leader>rc :terminal ruby %:t<return>

  command! -nargs=* -complete=file -bang Rename call Rename(<q-args>, '<bang>')

  function! Rename(name, bang)
    let l:name    = a:name
    let l:oldfile = expand('%:p')

    if bufexists(fnamemodify(l:name, ':p'))
      if (a:bang ==# '!')
        silent exe bufnr(fnamemodify(l:name, ':p')) . 'bwipe!'
      else
        echohl ErrorMsg
        echomsg 'A buffer with that name already exists (use ! to override).'
        echohl None
        return 0
      endif
    endif

    let l:status = 1

    let v:errmsg = ''
    silent! exe 'saveas' . a:bang . ' ' . l:name

    if v:errmsg =~# '^$\|^E329'
      let l:lastbufnr = bufnr('$')

      if expand('%:p') !=# l:oldfile && filewritable(expand('%:p'))
        if fnamemodify(bufname(l:lastbufnr), ':p') ==# l:oldfile
          silent exe l:lastbufnr . 'bwipe!'
        else
          echohl ErrorMsg
          echomsg 'Could not wipe out the old buffer for some reason.'
          echohl None
          let l:status = 0
        endif

        if delete(l:oldfile) != 0
          echohl ErrorMsg
          echomsg 'Could not delete the old file: ' . l:oldfile
          echohl None
          let l:status = 0
        endif
      else
        echohl ErrorMsg
        echomsg 'Rename failed for some reason.'
        echohl None
        let l:status = 0
      endif
    else
      echoerr v:errmsg
      let l:status = 0
    endif

    return l:status
  endfunction
" }}}

"=========================================================
"         Navigation keymaps           "
"=========================================================

" Windows resizing, tab-buffer navigation and some other stuffs --- {{{
"Visual mode pressing * or # searches for the current selection
  vnoremap <silent> *:call VisualSelection('f')<CR>
  vnoremap <silent> #:call VisualSelection('b')<CR>

"Set LEADER + q to quit by closing all windows, if there are unsaved changes,
"it'll warn you about it
  nnoremap <leader>q :qall<return>

"; instead of : for command mode
  nnoremap ; :

"Leader + ct is :checktime for updating current buffer
  nnoremap <leader>ct :checktime<return>

"Maps for windows resize
  nnoremap <silent> <leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
  nnoremap <silent> <leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
  nnoremap <silent> <leader>] :vertical resize +5<CR>
  nnoremap <silent> <leader>[ :vertical resize -5<CR>

"For terminal mode and window navigation
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
  map <C-h> <C-w>h

"set tt for entering Terminal mode, tv for vertical split, and th for
"horizontal split
  nnoremap tt :terminal<return>
  nnoremap tv :vsplit +terminal<return>
  nnoremap th :split +terminal<return>

"Tabs and buffer manipulation
  nnoremap <leader>tn :tabnew<return>
  nnoremap <leader>tc :close!<return>
  nnoremap ]t :tabn<return>
  nnoremap [t :tabp<return>
  nnoremap ]b :bn<return>
  nnoremap [b :bp<return>
  nnoremap <leader>v :b#<CR><return>
  nnoremap <leader>bc :bd!<return>
  nnoremap <leader>eb :enew<return>
  nnoremap <leader>bl :ls<return>

" }}}

"=========================================================
"         Other keymaps and abbrev       "
"=========================================================

" Keymaps for simple things ---- {{{
"set rlt to generate c-tags on current project, excluding .git/ - pkg - only
"for rails directory
  set tags=.git/tags
"Fire up IRB with --simple-prompt
  nnoremap <leader>ri :term irb --simple-prompt<return>
"Focus on the current pane
  nnoremap <silent> <leader>o :on<return>
"For some rake tasks
  nnoremap <leader>rr :terminal bundle exec rake routes<return>
  nnoremap <leader>rtt :terminal bundle exec rake test<return>
  nnoremap <leader>rte :terminal bundle exec rake test
  nnoremap <leader>rdm :terminal bundle exec rake db:migrate<return>
  nnoremap <leader>rdr :terminal bundle exec rake db:rollback<return>
  nnoremap <leader>rrs :terminal bundle exec ruby %:t<return>
"some mappings
  nnoremap <leader>cl :set cursorline!<return>
  nnoremap <leader>rn :set relativenumber!<return>
  nnoremap <silent> <esc>k :noh<return>
  inoremap <Down> <NOP>
  inoremap <Up> <NOP>
  inoremap <Left> <NOP>
  inoremap <Right> <NOP>
  noremap <Down> <NOP>
  noremap <Up> <NOP>
  noremap <Left> <<<esc>
  noremap <Right> >><esc>
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  nnoremap <leader>a :A<CR>
"Mappings for sourcing and making sessions, ss for save session and so
" session-source, now works with neovim
  nnoremap <leader>ss :mksession! ~/.nvim/session/
  nnoremap <leader>so :source ~/.nvim/session/
"chat next locations
  nnoremap <space><space> ci)
  onoremap in( :<c-u>normal! f(vi(<cr>
  onoremap il( :<c-u>normal! F)vi(<cr>
  onoremap in{ :<c-u>normal! f{vi{<cr>
  onoremap il{ :<c-u>normal! F}vi{<cr>
  onoremap in[ :<c-u>normal! f[vi[<cr>
  onoremap il[ :<c-u>normal! F]vi[<cr>
"control + d(down) to move current down one line, control + a(above) to move up one line
  noremap <c-d> ddp
  noremap <c-a> ddkP
"Upcase inner word in normal or insert mode with control + u
  inoremap <c-u> <Esc>gUiw
  nnoremap <c-u> gUiw
"myemail = matias.pan26@gmail.com
  iabbrev myemail matias.pan26@gmail.com
" }}}

"=========================================================
"         Plugins config             "
"=========================================================

"keymaps, global variables definition for plugins(Fugitive, ultisnips, CtrlP, gist, multicursor, startify, etc) -- {{{

"Deoplete stuff
  set runtimepath+=~/Documents/dotfiles/.nvim/plugged/deoplete.nvim/
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#disable_auto_complete = 0
  let g:deoplete#max_list = 20
  "let g:deoplete#max_menu_width = 10
  "let g:deoplete#omni#input_patterns = {}
  "let g:deoplete#omni#input_patterns.ruby = ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::']
  "let g:monster#completion#rcodetools#backend = "rct_complete"
  let g:deoplete#sources#omni#input_patterns = {
        \   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
        \}


"Fugitive plugin keymaps for basic git operations:
  nnoremap <leader>gs :Gstatus<return>
  nnoremap <leader>gc :Gcommit<return>
  nnoremap <leader>gl :Git log --oneline --abbrev-commit --graph --decorate --all<return>
  nnoremap <leader>gw :Gwrite<return>

"Call :StripWhitespace with <leader>sw
  nnoremap <leader>sw :StripWhitespace<return>

"Gist plugin configs
  let g:gist_clip_command = 'pbcopy'
  let g:gist_detect_filetype = 1
  let g:gist_open_browser_after_post = 1
  let g:gist_update_on_write = 1
  nnoremap <leader>hg :Gist<return>

"Maps for vim-multiple cursor
  let g:multi_cursor_next_key='<C-n>'
  let g:multi_cursor_skip_key='<C-x>'
  let g:multi_cursor_quit_key='<Esc>'

" Indent when defining private, protected and public methods
  let g:ruby_indent_access_modifier_style = 'indent'

"For drew neils vim-textobj-rubyblock definition
  runtime macros/matchit.vim

"Set control + e to sparkup completion
  let g:sparkupExecuteMapping='<C-e>'
  let g:sparkupMappingInsertModeOnly='1'

"Indent line configs
  let g:indentLine_color_gui = '#2a3341'
  let g:indentLine_char = '│'
  let g:indentLine_fileType = [ 'tmpl', 'haml', 'html', 'css', 'yaml', 'yml', 'coffee' ]

"Disable hunks
  nmap ]h <Plug>GitGutterNextHunk
  nmap [h <Plug>GitGutterPrevHunk
  let g:airline#extensions#hunks#enabled = 0
  let g:gitgutter_override_sign_column_highlight = 0
  let g:gitgutter_map_keys = 0
  let g:gitgutter_sign_added = '│'
  let g:gitgutter_sign_modified = '│'
  let g:gitgutter_sign_removed = '│'
  let g:gitgutter_sign_removed_first_line = '│'
  let g:gitgutter_sign_modified_removed = '│'

"vim-test
  let g:test#strategy = 'neovim'
  nmap <silent> <leader>ns :TestNearest<CR>
  nmap <silent> <leader>fs :TestFile<CR>
  nmap <silent> <leader>as :TestSuite<CR>
  nmap <silent> <leader>ls :TestLast<CR>

"NERDTree
  nnoremap <F7> :NERDTreeToggle<CR>

"Go configs
  let g:go_auto_sameids = 0
  let g:go_highlight_extra_types = 1
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_build_constraints = 1
  let g:go_fmt_command = "goimports"
  let g:go_term_mode = "split"
  let g:go_term_enabled = 1
  let g:go_test_timout = 40
  let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
  let g:deoplete#sources#go#use_cache = 1
" let g:deoplete#sources#go#json_directory = '/path/to/data_dir'
  au FileType go nmap gd <Plug>(go-def-split)
  au FileType go nmap <leader>gd <Plug>(go-doc)
  au FileType go nmap <leader>gs <Plug>(go-implements)
  au FileType go nmap <leader>gi <Plug>(go-info)
  au FileType go nmap <leader>gr <Plug>(go-rename)
  au FileType go nmap <leader>rv <Plug>(go-run-vertical)
  au FileType go nmap <leader>gt <Plug>(go-test)
  au FileType go nmap <leader>gb <Plug>(go-describe)
  au FileType go nmap <leader>gr <Plug>(go-referrers)
  au FileType go nmap <leader>ge <Plug>(go-whicherrs)
  au FileType go nmap <leader>gxo <Plug>(go-sameids)
  au FileType go nmap <Leader>gg <Plug>(go-coverage-toggle)
  au FileType go nmap <silent> <leader>gxf :GoSameIdsClear<cr>
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')


"Tagbar stuff
  nmap <F8> :TagbarToggle<CR>

"Vim-javascript
"  let g:javascript_enable_domhtmlcss=1
   let g:used_javascript_libs = 'react,jquery,flux'
"  let g:jsx_ext_required = 1 " Allow JSX in normal JS files
   let g:jsx_ext_required = 0

"Unite
  let g:unite_source_history_yank_enable = 1
  nnoremap <space>y :Denite neoyank<cr>
  nnoremap <space>/ :Denite grep<cr>
  nnoremap <space>p :Denite file_rec<cr>
  nnoremap <space>s :Denite buffer<cr>

  "NERDcommenter
  let g:NERDSpaceDelims = 1
  let g:NERDCompactSexyComs = 1
  nnoremap gc <plug>NERDCommenterToggle

"split-term
  set splitright

"Ultisnips
  let g:UltiSnipsExpandTrigger="<c-j>"
  let g:UltiSnipsJumpForwardTrigger="<c-l>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" }}}
