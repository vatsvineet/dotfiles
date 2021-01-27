
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Vim Settings
""" ============
""" Stock settings, bindings, macro's etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Indentation
set autoindent           " Use auto indentation
set copyindent           " Copy previous indentation when auto indenting
"set expandtab
set noexpandtab          " Use hard tabs
set tabstop=8            " Use 8 spaces for soft tabs
set shiftwidth=8         " Use 8 spaces for reindenation
set softtabstop=8        " Use 8 spaces in insert mode
set smarttab             " Insert tabs at start of line by shiftwidth amount
set ai
set si
set backspace=indent,eol,start

"" Undo & History
set history=1000         " Remember more commands and search history
set undolevels=1000      " MOAR levels of undo
set visualbell           " Don't beep
set noerrorbells         " Don't beep

"" Who needs swap files and backups? Not me!
set nowritebackup  "only in case you don't want a backup file while editing
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files
set nowb

" No wrapping
set nowrap

"" Search Options
set ignorecase
set smartcase            " Ignore case only if search term is all lower case
set hlsearch             " Highlight searched terms
set incsearch            " Show highlighted terms as you search

"" Appearence
set encoding=UTF-8       " Use UTF-8
set t_Co=256             " Use 256 colours
set laststatus=2         " Always show status line
set number               " Line numbers are great
set relativenumber       " Relative number are great too.
set title                " Change the terminal's title
set wildmenu             " Fancy autocompletion
set cursorline           " underline the current line.
set list                 " Show whitespace characters, and configure
set listchars=tab:\|\ ,trail:·,
set background=dark
set ruler
set backspace=eol,start,indent
set lazyredraw
set nohlsearch
set magic
set showmatch
set foldcolumn=1
set completeopt=longest,menuone,preview
set previewheight=10



"syntax on                " Use syntax highlighting
syntax spell toplevel
" colorscheme adventurous
" Different background color for 80 charactors onwards
let &colorcolumn=join(range(180,181),",") " Colour 80 char column and column's >100

"" Map :W to sudo write
command W w !sudo tee % > /dev/null

"" Completely useful date string
iab xdate <c-r>=strftime("%d-%m-%y %H:%M:%S")<cr>

"" Misc
" set pastetoggle=<F2>     " Paste mode when pressing F2
" set mouse=v              " We like using the mouse
" set mousehide               " Hide the mouse cursor while typing
" set scrolloff=100        " Dodgy Typewriter mode
" Keep cursor from going to topmost/bottommost
" set scrolloff=10
" set modeline             " Use modelines

"" Quicker Tab Shortcuts
" nmap <A-1> 1gt
" nmap <A-2> 2gt
" nmap <A-3> 3gt
" nmap <A-4> 4gt
" nmap <A-5> 5gt
" nmap <A-6> 6gt
" nmap <A-7> 7gt
" nmap <A-8> 8gt
" nmap <A-9> 9gt

"" Fixes/Overrides for specific file types:

" OpenCL syntax highlighting
au BufReadPost *.cl setlocal syntax=c

" Latex files
" au BufReadPre,BufNewFile *.tex
	" \ setlocal textwidth=79 expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Markdown files
au BufReadPre,BufNewFile *.md
	\ setlocal textwidth=79 expandtab tabstop=4 shiftwidth=4 softtabstop=4

" Python files
au BufReadPre,BufNewFile *.py
	\ setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

" CS files
au BufReadPre,BufNewFile *.cs
	\ setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

"" Strip trailing whitespace on file save
fun! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePost * :call StripTrailingWhitespaces()





" set autoread
let mapleader = ","
set clipboard=unnamedplus
set runtimepath^=~/notes

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


"nnoremap <Leader>h <C-w>h
"nnoremap <Leader>j <C-w>j
"nnoremap <Leader>k <C-w>k
"nnoremap <Leader>l <C-w>l

nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-c> :tabclose<CR>
tnoremap <C-tab>  <C-\><C-N>:tabnext<CR>
tnoremap <C-S-tab> <C-\><C-N>:tabprevious<CR>
tnoremap <C-t> <C-\><C-N>:tabnew<CR>

" Remap arrow keys to resize window
nnoremap <Down>    :resize -3<CR>
nnoremap <Up>      :resize +5<CR>
nnoremap <Left>   :vertical resize -3<CR>
nnoremap <Right>    :vertical resize +5<CR>


" Quick fix
"map <C-j> :cn<CR>
"map <C-k> :cp<CR>

map <Esc><Esc> :w<CR>

" imap <C-s> <esc>:w<CR>
" map <C-s> <esc>:w<CR>
" " CTRL-C to copy (visual mode)
" vmap <C-c> y
" " CTRL-X to cut (visual mode)
" vmap <C-x> x
" " CTRL-V to paste (insert mode)
" imap <C-v> <esc>P

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Vim Plug
""" ============
""" list of plugin to PlugInstall.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf.vim'
    Plug 'morhetz/gruvbox'
    Plug 'w0rp/ale'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'OmniSharp/omnisharp-vim'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'dracula/vim', { 'as' : 'dracula' }
    Plug 'ntpeters/vim-better-whitespace'
    " Plug 'puremourning/vimspector' . # not supported for dotnet core yet.
    Plug 'severin-lemaignan/vim-minimap'
    Plug 'ryanoasis/vim-devicons'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-commentary'
    Plug 'christoomey/vim-tmux-navigator'

    Plug 'inkarkat/vim-spellcheck'    " Spell Checking
    Plug 'vim-scripts/ingo-library'   " Required for Spell Checking

call plug#end()
colorscheme gruvbox
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Airline
let g:airline_theme = "murmur"
"let g:airline_theme = "bubblegum"
"let g:airline_theme = "base16"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Vimspector
" let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
" packadd! vimspector

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" GitGutter
let g:gitgutter_terminal_reports_focus=0
let g:gitgutter_map_keys=0
set updatetime=100
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
command! Stage GitGutterStageHunk
command! Undo  GitGutterUndoHunk
highlight link GitGutterAdd          Function
highlight link GitGutterChange       Special
highlight link GitGutterDelete       Tag
highlight link GitGutterChangeDelete Special

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" NERDTree-git

let g:NERDTreeGitStatusIndicatorMapCustom = {
	\ "Modified"  : "✭",
	\ "Staged"    : "✚",
	\ "Untracked" : "■",
	\ "Renamed"   : "➜",
	\ "Unmerged"  : "≈",
	\ "Deleted"   : "✖",
	\ "Dirty"     : "✹",
	\ "Clean"     : "✓",
	\ "Ignored"   : "□",
	\ "Unknown"   : "‽"
	\ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Commentary
filetype plugin on
autocmd FileType cs  setlocal commentstring=//\ %s
autocmd FileType c   setlocal commentstring=//\ %s
autocmd FileType h   setlocal commentstring=//\ %s
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType hpp setlocal commentstring=//\ %s
nmap <silent> <C-_> gcc
imap <silent> <C-_> <C-o>gcc
vmap <silent> <C-_> gc


" auto complete 
" Asyncomplete
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"


" ALE
let g:ale_linters = { 'cs' : ['OmniSharp'] }
let g:ale_sign_column_always = 1
let g:ale_virtualtext_cursor = 1
let g:ale_echo_cursor = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠️'

" FZF
nmap <Leader><Tab> <Plug>(fzf-maps-n)
nmap <Leader>p :Files<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" NERDTree.
""" ============
""" NERDTree Configuration.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree
" Ignore C# build folders
let NERDTreeIgnore=['bin$[[dir]]', 'obj$[[dir]]', '\.vs$[[dir]]', '\~$']
let g:NERDTreeChDirMode=2
let g:NERDTreeShowBookmarks=0
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 40
let g:NERDTreeQuitOnOpen = 0
let g:NERDTreeMinimalUI = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
noremap <F4> :NERDTreeToggle<CR>
" nnoremap <F5> :NERDTreeFind<CR>
" nnoremap <F3> :NERDTree .<CR>
autocmd VimEnter * call OpenNERDTree()  " Autostart NERDTree
"autocmd VimEnter * wincmd p             " And then focus on file
"autocmd BufWinEnter * NERDTreeMirror
autocmd TabLeave * if bufname('') =~ "Nerd_tree" | wincmd l | endif
autocmd BufEnter * call CheckForAutoClose()
function CheckForAutoClose()
	if winnr("$") == 1
		" If NERDTree is open, or quickfix list is open (implying the
		" only window is not a file) -> do not close
		if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
		   \ || getwinvar(1, '&syntax') == 'qf'
			q
		endif
	elseif winnr("$") == 2
		" If NERDTree and quickfix list is open (implying both windows
		" are not files) -> do not close
		if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
		\   &&
		\  (getwinvar(1, '&syntax') == 'qf' || getwinvar(2, '&syntax') == 'qf')
			q|q|return
		endif
	endif
endfunction

 
" Autostarts NERDTree if the window is wide enough
function OpenNERDTree()
	if winwidth(0) < 120
    NERDTree
    NERDTreeToggle
  else
    NERDTree
	endif
endfunction



" sync open file with NERDTree
" Check if NERDTree is open or active
 function! IsNERDTreeOpen()
   return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
 endfunction

 " Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
 " file, and we're not in vimdiff
 function! SyncTree()
   if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
     NERDTreeFind
     wincmd p
   endif
 endfunction

" Highlight currently open buffer in NERDTree
 autocmd BufEnter * call SyncTree()






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Omnisharp Settings
""" ============
"""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OmniSharp won't work without this setting
" filetype plugin on
" filetype indent on
filetype indent plugin on
syntax enable

" Use the stdio version of OmniSharp-roslyn - this is the default
let g:OmniSharp_server_stdio = 1

let g:OmniSharp_timeout = 5
let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_autoselect_existing_sln = 1
let g:OmniSharp_popup_position = 'peek'
let g:OmniSharp_highlighting = 3
let g:OmniSharp_diagnostic_exclude_paths = [ 'Temp\\', 'obj\\', '\.nuget\\' ]
let g:OmniSharp_selector_ui = ''
let g:OmniSharp_fzf_options = { 'down': '10' }


" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview', 'popup'
" and 'popuphidden' if you don't want to see any documentation whatsoever.
" Note that neovim does not support `popuphidden` or `popup` yet:
" https://github.com/neovim/neovim/issues/10996
if has('patch-8.1.1880')
  set completeopt=longest,menuone,popuphidden
  " Highlight the completion documentation popup background/foreground the same as
  " the completion menu itself, for better readability with highlighted
  " documentation.
  set completepopup=highlight:Pmenu,border:off
else
  set completeopt=longest,menuone,preview
  " Set desired preview window height for viewing documentation.
  set previewheight=5
endif

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] } 

augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  " autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>fu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>fi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>pd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>pi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>t <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>od <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>fs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <C-i> <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>gcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>ca <Plug>(omnisharp_code_actions)
  " Repeat the last code action performed (does not use a selector)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

  autocmd FileType cs nmap <silent> <buffer> <C-k><C-d>  <Plug>(omnisharp_code_format)

  
  autocmd FileType cs nmap <silent> <buffer> <F2> <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <buffer> <Leader>rt <Plug>(omnisharp_run_test)
  autocmd FileType cs nmap <buffer> <Leader>rT <Plug>(omnisharp_run_tests_in_file)
  " Synchronous build (blocks Vim)
  autocmd FileType cs nnoremap <buffer> <F5> :wa!<CR>:OmniSharpBuild<CR>
  " Builds can also run asynchronously with vim-dispatch installed
  autocmd FileType cs nnoremap <buffer> <F6> :wa!<CR>:OmniSharpBuildAsync<CR>
  " Automatic syntax check on events (TextChanged requires Vim 7.4)
  " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

  " Show type information automatically when the cursor stops moving
  autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

  " The following commands are contextual, based on the cursor position.

  " Finds members in the current buffer
  autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

  " Cursor can be anywhere on the line containing an issue
  autocmd FileType cs nnoremap <buffer> <Leader>f  :OmniSharpFixIssue<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>


  " Navigate up and down by method/property/field
  autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
  autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>


  " vim-better-whitespace
  autocmd FileType cs let g:strip_whitespace_on_save = 1
  autocmd FileType cs let g:strip_whitespace_confirm = 0 

  autocmd FileType cs nmap <silent> <buffer> <Leader>sr <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ss <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>sp <Plug>(omnisharp_stop_server)
augroup END


"
" Force OmniSharp to reload the solution. Useful when switching branches etc.
 nnoremap <Leader>rl :OmniSharpReloadSolution<CR>
 nnoremap <Leader>cf :OmniSharpCodeFormat<CR>
" Add syntax highlighting for types and interfaces
 nnoremap <Leader>th :OmniSharpHighlightTypes<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" dotvimrc urls.
""" ============
"""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"https://github.com/AnthonyWharton/dotfiles/blob/master/vim/.vimrc#L151-L170
"https://github.com/OmniSharp/omnisharp-vim/wiki/Example-config


