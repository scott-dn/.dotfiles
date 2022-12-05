call plug#begin('~/.vim/plugged')

" Utilities
Plug 'scrooloose/nerdtree'
" Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/denite.nvim'
Plug 'airblade/vim-rooter'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-denite'

" c++


" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Syntax & colors highlight
Plug 'sheerun/vim-polyglot'

" Themes
Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()

filetype indent plugin on " enable indent plugin with filetype
set mouse=a " use mouse
set ignorecase " Ignoring case in a pattern
set encoding=utf8
set nocursorline
set number

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set noerrorbells " no bell
set novisualbell

set autoread " automatically read file again
set clipboard=unnamedplus " copy past clipboard

set hidden " hidden buffers
set nobackup
set nowritebackup
set noswapfile
set nojoinspaces

set cmdheight=2

set ttimeoutlen=10
set timeoutlen=500

set expandtab
set shiftround
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set nowrap

set updatetime=300

set shortmess+=c

set splitright
set splitbelow

syntax on

set background=dark

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" one dark theme
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256
let g:airline_theme='onedark'
" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif
colorscheme onedark

" Integrating with powerline fonts
let g:airline_powerline_fonts = 1

" Some custom style
highlight Normal guibg=NONE
highlight Search guibg=darkmagenta guifg=lightgray

let mapleader = ","

" Smart way to move between windows
map <c-j> <C-W>j
map <c-k> <C-W>k
map <c-h> <C-W>h
map <c-l> <C-W>l

" Split window
map <C-v> :vsplit<cr>
map <C-s> :split<cr>
map <C-t> :tabnew<cr>

" Move between tab
noremap <c-s-right> :tabnext<cr>
noremap <c-s-left> :tabprevious<cr>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" no recording
" map q <Nop>

" Remap VIM 0 to first non-blank character
" map 0 ^

" Auto remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e

" Autosave buffers before leaving them
autocmd BufLeave * silent! :wa

set listchars=eol:¬,tab:\|\ ,trail:▫,extends:>,precedes:<,space:·
set list

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Fast quit
nnoremap qq :q<cr>
nnoremap QQ :q!<cr>

" Fast write
nnoremap <leader>w :w!<cr>

" Edit my vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source my vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>

" Abbreviations my signature
inoremap <leader>sig -- <cr>Scott Dang<cr>namdh2604@gmail.com

" Exit insert mode
inoremap jk <esc>

" Stop using arrow key normal mode
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Keep my lines 110 chars at most
" Highlight column number 110 with color
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

" Toggle highlight search
noremap <F3> :set hlsearch! hlsearch?<cr>

set spell spelllang=en_us
set nospell
noremap <F2> :set spell! spell?<cr>

" Copy buffer a whole file
nnoremap YY :%y+<cr>

" move block in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F8> :TagbarToggle<cr>
let g:tagbar_sort = 0
let g:tagbar_compact = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F7> :NERDTreeToggle<cr>
nmap <leader>n :NERDTreeFind<CR>
let g:NERDTreeWinSize=35
let g:NERDSpaceDelims = 1
let NERDTreeShowHidden=1
let NERDTreeMapOpenSplit='s'
let NERDTreeMapOpenVSplit='v'
let g:NERDTreeIgnore = [
    \ '^\.DS_Store$',
    \ '^tags$',
    \ '\.git$[[dir]]',
    \ '\.vscode',
    \ '\.idea$[[dir]]',
    \ '\.sass-cache$',
    \ '^\.settings$',
    \ '^.husky$',
    \ '^node_modules$',
    \ '^build$',
    \ '^public$',
    \ '^dist$',
    \ '^bin$',
    \ '^\.vim$',
    \ '^\.classpath$',
    \ '^.*\.class$'
    \ ]

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Floating Term
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:float_term_border_win = 0
let s:float_term_win = 0
function! FloatTerm(...)
  " Configuration
  let height = float2nr((&lines - 2) * 0.6)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns * 0.6)
  let col = float2nr((&columns - width) / 2)
  " Border Window
  let border_opts = {
        \ 'relative': 'editor',
        \ 'row': row - 1,
        \ 'col': col - 2,
        \ 'width': width + 4,
        \ 'height': height + 2,
        \ 'style': 'minimal'
        \ }
  " Terminal Window
  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  let top = "╭" . repeat("─", width + 2) . "╮"
  let mid = "│" . repeat(" ", width + 2) . "│"
  let bot = "╰" . repeat("─", width + 2) . "╯"
  let lines = [top] + repeat([mid], height) + [bot]
  let bbuf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(bbuf, 0, -1, v:true, lines)
  let s:float_term_border_win = nvim_open_win(bbuf, v:true, border_opts)
  let buf = nvim_create_buf(v:false, v:true)
  let s:float_term_win = nvim_open_win(buf, v:true, opts)
  " Styling
  call setwinvar(s:float_term_border_win, '&winhl', 'Normal:Normal')
  call setwinvar(s:float_term_win, '&winhl', 'Normal:Normal')
  if a:0 == 0
    terminal
  else
    call termopen(a:1)
  endif
  startinsert
  " Close border window when terminal window close
  autocmd TermClose * ++once :bd! | call nvim_win_close(s:float_term_border_win, v:true)
endfunction

nnoremap TT :call FloatTerm()<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for apply code actions at the cursor position.
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer.
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for apply refactor code actions.
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')
" Format shortcut
nnoremap FF :Format<cr>

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" Floating Term
let s:float_term_border_win = 0
let s:float_term_win = 0
function! FloatTerm(...)
  " Configuration
  let height = float2nr((&lines - 2) * 0.6)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns * 0.6)
  let col = float2nr((&columns - width) / 2)
  " Border Window
  let border_opts = {
        \ 'relative': 'editor',
        \ 'row': row - 1,
        \ 'col': col - 2,
        \ 'width': width + 4,
        \ 'height': height + 2,
        \ 'style': 'minimal'
        \ }
  " Terminal Window
  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  let top = "╭" . repeat("─", width + 2) . "╮"
  let mid = "│" . repeat(" ", width + 2) . "│"
  let bot = "╰" . repeat("─", width + 2) . "╯"
  let lines = [top] + repeat([mid], height) + [bot]
  let bbuf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(bbuf, 0, -1, v:true, lines)
  let s:float_term_border_win = nvim_open_win(bbuf, v:true, border_opts)
  let buf = nvim_create_buf(v:false, v:true)
  let s:float_term_win = nvim_open_win(buf, v:true, opts)
  " Styling
  call setwinvar(s:float_term_border_win, '&winhl', 'Normal:Normal')
  call setwinvar(s:float_term_win, '&winhl', 'Normal:Normal')
  if a:0 == 0
    terminal
  else
    call termopen(a:1)
  endif
  startinsert
  " Close border window when terminal window close
  autocmd TermClose * ++once :bd! | call nvim_win_close(s:float_term_border_win, v:true)
endfunction

" Vim easymotion
nmap <silent> ;; <Plug>(easymotion-overwin-f)
nmap <silent> ;l <Plug>(easymotion-overwin-line)

" Auto change root of the project
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = ['Cargo.toml', 'package.json', '.git/', 'go.mod', '.gradle/']

" " DENITE
call denite#custom#var('buffer', 'date_format', '')
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o>
    \ <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <Esc>
    \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
    \ denite#do_map('quit')
  inoremap <silent><buffer><expr> <CR>
    \ denite#do_map('do_action')
  inoremap <silent><buffer><expr> <C-t>
    \ denite#do_map('do_action', 'tabopen')
  inoremap <silent><buffer><expr> <C-v>
    \ denite#do_map('do_action', 'vsplit')
  inoremap <silent><buffer><expr> <C-s>
    \ denite#do_map('do_action', 'split')
endfunction

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
      \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> <C-t>
      \ denite#do_map('do_action', 'tabopen')
    nnoremap <silent><buffer><expr> <C-v>
      \ denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr> <C-s>
      \ denite#do_map('do_action', 'split')
    nnoremap <silent><buffer><expr> d
      \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> <c-p>
      \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> <Esc>
      \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> q
      \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
      \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <c-a>
      \ denite#do_map('toggle_select_all')
    nnoremap <silent><buffer><expr> <space>
      \ denite#do_map('toggle_select').'j'
endfunction

nmap <leader>b :Denite buffer<CR>
nmap <leader>p :DeniteProjectDir file/rec<CR>
nnoremap <leader>FF :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>ff :<C-u>DeniteCursorWord grep:.<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Semantic highlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F9> :SemanticHighlightToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => C++ for competitive programming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Compile and run c++
autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ -std=c++11 -DLOCAL '.shellescape('%').' -o '.shellescape('%:r').'.out'<CR>
autocmd filetype cpp nnoremap <F6> :w <bar> exec '!g++ -std=c++11 -DLOCAL '.shellescape('%').' -o '.shellescape('%:r').'.out && ./'.shellescape('%:r').'.out'<CR>
autocmd filetype cpp nnoremap <LEADER>tcp :0r ~/.config/nvim/templates/cpp/competitive.cpp<CR>:%s/{{DATETIME}}/\=strftime("%c")/g<CR>:%s/{{AUTHOR}}/Scott Dang/g<CR>:%s/{{MOUSEHERE}}//g<CR>zzA


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rust
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Compile, test, run
autocmd filetype rust nnoremap <F4> :w <bar> exec '!cargo test -- --show-output'<CR>
autocmd filetype rust nnoremap <F5> :w <bar> exec '!cargo build'<CR>
autocmd filetype rust nnoremap <F6> :w <bar> exec '!cargo run'<CR>
autocmd filetype rust nnoremap <F8> :w <bar> exec '!cargo clippy'<CR>
autocmd filetype rust nnoremap <F9> :w <bar> exec '!cargo fmt --all'<CR>

" all in one
autocmd filetype rust nnoremap <F10> :w <bar> exec '!cargo build && cargo test -- --show-output && cargo clippy && cargo fmt --all'<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Java
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType java setlocal shiftwidth=4 softtabstop=4
let g:semanticEnableFileTypes = ['java']
let java_highlight_all = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use golang language server
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Highlight more info
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1

let g:go_auto_sameids = 1

" disable gd mapping of vim-go
let g:go_def_mapping_enabled = 0

let g:go_auto_type_info = 1
let g:go_echo_command_info = 1
let g:go_test_show_name = 1
let g:go_list_type = 'quickfix'
let g:go_gocode_propose_source=1

let g:go_metalinter_autosave = 1
let g:go_metalinter_command = "golangci-lint"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']

" debug option
" let g:go_debug=['shell-commands']
"
" Mappings
au FileType go nmap <leader>gl :GoMetaLinter<cr>
au FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
au FileType go nmap <leader>gd <Plug>(go-doc)
