" General {{{
" Set as not compatible with vi {{{
set nocompatible
" }}}
" Plugins  {{{
" Start {{{
call plug#begin('~/.vim/bundle')
" }}}
" Vim UX {{{
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'flazz/vim-colorschemes'
Plug 'w0rp/ale'                          " Linter engine
Plug 'tpope/vim-commentary'              " Comments shortcuts
Plug 'tpope/vim-sensible'                " Initial vimrc configs that everyone agree on
Plug 'vim-airline/vim-airline'           " Airline
Plug 'vim-airline/vim-airline-themes'    " Airline themes
Plug 'junegunn/vim-emoji'                " Support for emoji
Plug 'fholgado/minibufexpl.vim'          " Buffer explorer
Plug 'sjl/gundo.vim'                     " Undo tree
Plug 'jbgutierrez/vim-better-comments'   " Better comments UI
" }}}
" tmux UX {{{
Plug 'edkolev/tmuxline.vim'
" }}}
" Completion {{{
Plug 'Valloric/YouCompleteMe' " Autocompletion feature. Follow installation instructions in github
Plug 'honza/vim-snippets'     " Snippets for multiple languages
Plug 'mattn/emmet-vim'        " Emmet
Plug 'jiangmiao/auto-pairs'   " Auto pairs
Plug 'tpope/vim-surround'     " Shortcuts to change brackets, quotes, etc in pairs
Plug 'tpope/vim-unimpaired'   " I use this one only for the {/} + space shortcut
Plug 'heavenshell/vim-jsdoc'
Plug 'vim-scripts/repmo.vim'  " Repeat motion for which a count was given
Plug 'ctrlpvim/ctrlp.vim'     " Ctrl+p
" }}}
" Dependencies support {{{
Plug 'editorconfig/editorconfig-vim'
Plug 'flowtype/vim-flow'
" }}}
" Languages and libraries support {{{
Plug 'jparise/vim-graphql'
Plug 'sheerun/vim-polyglot'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'myhere/vim-nodejs-complete'
Plug 'ap/vim-css-color'
Plug 'heavenshell/vim-jsdoc'
Plug 'suan/vim-instant-markdown'
Plug 'lepture/vim-jinja'
Plug 'ledger/vim-ledger'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'mitermayer/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
" }}}
" Color schemes {{{
Plug 'dracula/vim'
" }}}
" End  {{{
call plug#end()
" }}}
" }}}
" Autocompletion (default) {{{
set complete=.,b,u,]               " In the above example it will pull from keywords in the current file, other buffers (closed or still open), and from the current tags file
set wildmode=longest,list:longest  " Read https://robots.thoughtbot.com/vim-you-complete-me
set completeopt=menu,preview       " Default menu
"}}}
" Misc {{{
" Buffers {{{
set hidden
" #}}}
" Error bells {{{
set noerrorbells
" #}}}
" Increment/decrement alternatives {{{
" C-a is a tmux custom reserved shortcut
nnoremap <C-i> <C-a>
" #}}}
" Use dot (.) with visual mode {{{
vnoremap . :norm.<CR>
" #}}}
" Redraw only when we need to {{{
set lazyredraw
" }}}
" Toggle paste {{{
nnoremap p\ :set paste<CR>
nnoremap p/ :set nopaste<CR>
" }}}
" Default leader key {{{
let mapleader = ","
" }}}
" Enable scrolling {{{
set mouse=a
" }}}
" Be more verbose about stuff generally {{{
set showcmd
" }}}
" Change default directories {{{
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
" }}}
" Use spaces {{{
set shiftwidth=2
set softtabstop=2
" }}}
" Autoload vimrc changes {{{
augroup myvimrc
  au!
  au BufWritePost .vimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
" }}}
" Allow saving of files as sudo when forgot to start vim using sudo. {{{
cmap w!! w !sudo tee > /dev/null %
" }}}
" No shift to enter commands, use semicolon {{{
nnoremap ; :
vnoremap ; :
" }}}
" Disable scratch preview window on autocomplete {{{
set completeopt=longest,menuone,preview
set completeopt-=preview
set pumheight=15
" }}}
" Modelines {{{
" Modelines are special comments somewhere in a file that can can declare
" certain Vim settings to be used only for that file.
set modelines=1
" }}}
" Map Esc to jk {{{
inoremap jk <Esc>
" }}}
" Don't split left nor above {{{
set splitright
set splitbelow
" }}}
" }}}
" Languages {{{
" Markdown {{{
" disable annoying code folding with vim-markdown
let g:vim_markdown_folding_disabled = 1

" enable yaml front matter highlighting in vim-markdown
let g:vim_markdown_frontmatter = 1

" disable conceal level of **bold**, *italic*, etc
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" disable autoindent with items new lines
let g:vim_markdown_new_list_item_indent = 0

" For Markdown preview
filetype plugin on
" }}}
" JSX {{{
" highlight jsx in regular .js files
let g:jsx_ext_required = 0
" }}}
" JSON {{{
let g:vim_json_syntax_conceal = 0 " disable quotes hiding
let g:vim_json_warnings=1         " error warnings

" Format JSON with python json.tool
function FormatJSON(...)
  let code="\"
        \ var i = process.stdin, d = '';
        \ i.resume();
        \ i.setEncoding('utf8');
        \ i.on('data', function(data) { d += data; });
        \ i.on('end', function() {
        \     console.log(JSON.stringify(JSON.parse(d), null,
        \ " . (a:0 ? a:1 ? a:1 : 2 : 2) . "));
        \ });\""
  execute "%! node -e " . code
endfunction

" Map FormatJSON function to f-j
nmap <leader>fj :<C-U>call FormatJSON(v:count)<CR>
" }}}
" JsDoc {{{
let g:jsdoc_enable_es6=1
" }}}
" ES6 mjs {{{
au BufNewFile,BufRead *.mjs set filetype=javascript
" }}}
" Emoji autocomplete {{{
set completefunc=emoji#complete
" }}}
" }}}
" UX {{{
" General {{{
set encoding=utf-8
" required if using https://github.com/bling/vim-airline
let g:airline_powerline_fonts=1
" highlight the selected line
set cursorline
" }}}
" Show line numbers {{{
set number
set relativenumber
" }}}
" Toggle line numbers {{{
nnoremap n\ :set number relativenumber<CR>
nnoremap n/ :set nonumber norelativenumber<CR>
" }}}
" Show vertical line {{{
set colorcolumn=120
" }}}
" Indent line {{{
let g:indentLine_color_term = 239
" }}}
" Briefly highlight matching brackets on close/open {{{
set showmatch
" }}}
" No wrapping {{{
set nowrap
" }}}
" Allow scrolling past the bottom of the document {{{
set scrolloff=1
" }}}
" Set color for folded text, see chart {{{
" https://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg
hi Folded ctermbg=236
" }}}
" Give us 256 color schemes! {{{
set term=screen-256color
" }}}
" Don't break mid word {{{
set linebreak
" }}}
" Hide mode since airline already shows it {{{
set noshowmode
" }}}
" }}}
"Colors {{{
" General {{{
syntax enable
set t_Co=256
" }}}
" Color scheme {{{
let g:airline_theme="minimalist"
let g:enable_bold_font = 1
set background:dark
colorscheme dracula
" }}}
" Powerline {{{
" set the CN (column number) symbol:
let g:airline_section_z = airline#section#create(["" . '%{line(".")}' . ":" . '%{col(".")}'])
" }}}
" Italic comments {{{
set t_ZH=[3m
set t_ZR=[23m
highlight Comment cterm=italic
" }}}
" Visual selection colors {{{
hi Visual term=reverse cterm=reverse guibg=Grey
" }}}
" Search selection colors {{{
hi Search ctermbg=214 ctermfg=black
" }}}
" }}}
" Copy to clipboard {{{
function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <silent> <C-y> y:call ClipboardYank()<cr>
"}}}
" IdleHighlight {{{
" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction
" }}}
" Fold {{{
" Map space to toggle fold
nnoremap <Space> za

" Mappings to foldmethod
nnoremap fms :set foldmethod=syntax<CR>
nnoremap fmm :set foldmethod=manual<CR>
" }}}
" Macros {{{
let @r="3j0wy$3kP"
let @s="I[Ship] "
let @h="I[Hotfix] "
let @t="I:rocket: "
" }}}
" Ranger {{{

" Compatible with ranger 1.4.2 through 1.7.*
"
" Add ranger as a file chooser in vim
"
" If you add this code to the .vimrc, ranger can be started using the command
" ":RangerChooser" or the keybinding "<leader>r".  Once you select one or more
" files, press enter and ranger will quit again and vim will open the selected
" files.

function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    if has("gui_running")
        exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>r :<C-U>RangerChooser<CR>
" }}}
" Search {{{
" control search highlight
nnoremap s\ :set hlsearch<CR>
nnoremap s/ :nohlsearch<CR>

set incsearch  " search as characters are entered
set ignorecase " search ignores case
set hlsearch   " highlight matches"
" }}}
" Shell {{{
" make vim use zsh
set shell=zsh
" }}}
" Trailing space {{{
" remove trailing space on F4
:nnoremap <silent> <F4> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
" }}}
" }}}
" Plugins options {{{
" Ale linter {{{
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_sign_column_always = 1

" use ctrl-k and ctrl-j for navigating between errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" show ALE in airline
let g:airline#extensions#ale#enabled = 1
" }}}
" BetterComments {{{
hi! def link TodoBetterComments Todo
hi! def link ErrorBetterComments Error
let g:bettercomments_skipped = ['html']
" }}}
" CtrlP {{{
 let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" }}}
" Emmet {{{
let g:user_emmet_leader_key='<C-E>' " c-e-,
" }}}
" Flow {{{
let g:flow#showquickfix = 0
" }}}
" Gundo {{{
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" }}}
" JsDoc{{{
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_returno = 1
let g:jsdoc_return_type = 1
let g:jsdoc_enable_es6 = 1
" }}}
" Ledger{{{
let g:ledger_fold_blanks = 1
let g:ledger_decimal_sep = ','
au FileType ledger nnoremap <Tab> :call ledger#align_amount_at_cursor()<CR>
au FileType ledger set foldmethod=syntax
" }}}
" MiniBufferExplorer {{{
" map ctrl-l to toggle MiniBufferExplorer
nmap <silent> <C-l> :MBEToggle<CR>
" }}}
" Prettier {{{
" map ctrl-h to trigger Prettier
nmap <silent> <C-h> :Prettier<CR>
" }}}
" UtilSnippets {{{
" Use ctrl-j to insert a snippet
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsEditSplit="vertical"
" }}}
" YouCompleteMe {{{
let g:ycm_complete_in_comments = 1                          " Use ycm in comments
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " Get words from comments and strings
" }}}
" }}}

" vim:foldmethod=marker:foldlevel=0
