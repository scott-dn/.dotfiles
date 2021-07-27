call plug#begin('~/.vim/plugged')

" Utilities
Plug 'scrooloose/nerdtree'
" Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
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
Plug 'majutsushi/tagbar'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-denite'

" c++


" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Syntax & colors highlight
Plug 'sheerun/vim-polyglot'
Plug 'jaxbot/semantic-highlight.vim'

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
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

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

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Format shortcut
nnoremap FF :Format<cr>

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

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

"----------------------------------------------
" Language: Golang
"----------------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

"----------------------------------------------
"
" Language: Bash
"----------------------------------------------
au FileType sh set noexpandtab
au FileType sh set shiftwidth=2
au FileType sh set softtabstop=2
au FileType sh set tabstop=2

"----------------------------------------------
" Language: CSS
"----------------------------------------------
au FileType css set expandtab
au FileType css set shiftwidth=2
au FileType css set softtabstop=2
au FileType css set tabstop=2

"----------------------------------------------
" Language: gitcommit
"----------------------------------------------
au FileType gitcommit setlocal spell
au FileType gitcommit setlocal textwidth=80

"----------------------------------------------
" Language: gitconfig
"----------------------------------------------
au FileType gitconfig set noexpandtab
au FileType gitconfig set shiftwidth=2
au FileType gitconfig set softtabstop=2
au FileType gitconfig set tabstop=2

"----------------------------------------------
" Language: HTML
"----------------------------------------------
au FileType html set expandtab
au FileType html set shiftwidth=2
au FileType html set softtabstop=2
au FileType html set tabstop=2

"----------------------------------------------
" Language: JavaScript
"----------------------------------------------
au FileType javascript set expandtab
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2
au FileType javascript set tabstop=2

"----------------------------------------------
" Language: JSON
"----------------------------------------------
au FileType json set expandtab
au FileType json set shiftwidth=2
au FileType json set softtabstop=2
au FileType json set tabstop=2

"----------------------------------------------
" Language: Make
"----------------------------------------------
au FileType make set noexpandtab
au FileType make set shiftwidth=2
au FileType make set softtabstop=2
au FileType make set tabstop=2

"----------------------------------------------
" Language: Markdown
"----------------------------------------------
au FileType markdown setlocal spell
au FileType markdown set expandtab
au FileType markdown set shiftwidth=4
au FileType markdown set softtabstop=4
au FileType markdown set tabstop=4
au FileType markdown set syntax=markdown

"----------------------------------------------
" Language: Protobuf
"----------------------------------------------
au FileType proto set expandtab
au FileType proto set shiftwidth=2
au FileType proto set softtabstop=2
au FileType proto set tabstop=2

"----------------------------------------------
" Language: Python
"----------------------------------------------
au FileType python set expandtab
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set tabstop=4

"----------------------------------------------
" Language: Ruby
"----------------------------------------------
au FileType ruby set expandtab
au FileType ruby set shiftwidth=2
au FileType ruby set softtabstop=2
au FileType ruby set tabstop=2

" Enable neomake for linting.
"au FileType ruby autocmd BufWritePost * Neomake

"----------------------------------------------
" Language: SQL
"----------------------------------------------
au FileType sql set expandtab
au FileType sql set shiftwidth=2
au FileType sql set softtabstop=2
au FileType sql set tabstop=2

"----------------------------------------------
" Language: TypeScript
"----------------------------------------------
au FileType typescript set expandtab
au FileType typescript set shiftwidth=2
au FileType typescript set softtabstop=2
au FileType typescript set tabstop=2

"----------------------------------------------
" Language: vimscript
"----------------------------------------------
au FileType vim set expandtab
au FileType vim set shiftwidth=4
au FileType vim set softtabstop=4
au FileType vim set tabstop=4

"----------------------------------------------
" Language: YAML
"----------------------------------------------
au FileType yaml set expandtab
au FileType yaml set shiftwidth=2
au FileType yaml set softtabstop=2
au FileType yaml set tabstop=2
