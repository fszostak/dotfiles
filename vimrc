" Starting config {{{
set nocompatible
" }}}

" Plugins {{{
call plug#begin('~/.vim/bundle')

" Vim UX
Plug 'SirVer/ultisnips'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Mizuchi/vim-ranger'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'flazz/vim-colorschemes'
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-emoji'
Plug 'fholgado/minibufexpl.vim'
Plug 'sjl/gundo.vim'
Plug 'ryanoasis/vim-devicons'

" tmux UX
Plug 'edkolev/tmuxline.vim'

" Completion
Plug 'Valloric/YouCompleteMe' " Follow installation instructions in github
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'joegesualdo/jsdoc.vim'

" Dependencies support
Plug 'editorconfig/editorconfig-vim'

" Languages and libraries support
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'myhere/vim-nodejs-complete'
Plug 'jparise/vim-graphql'
Plug 'elzr/vim-json'
Plug 'moby/moby' " Docker syntax
Plug 'ap/vim-css-color'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'heavenshell/vim-jsdoc'
Plug 'suan/vim-instant-markdown'
Plug 'wavded/vim-stylus'
Plug 'leafgarland/typescript-vim'
Plug 'lepture/vim-jinja'
Plug 'mitermayer/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

" Color schemes
Plug 'dracula/vim'

call plug#end()

" }}}

" Misc {{{
" Buffers
set hidden

" Use dot (.) with visual mode
vnoremap . :norm.<CR>

" redraw only when we need to.
set lazyredraw

" Search
set incsearch " search as characters are entered
set ignorecase " search ignores case
set hlsearch " highlight matches"

" turn off search highlight
nnoremap s\ :set hlsearch<CR>
nnoremap s/ :nohlsearch<CR>

" default leader key
let mapleader = ","

" enable scrolling
set mouse=a

" be more verbose about stuff generally
set showcmd

" change default directories
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" use spaces
set shiftwidth=2
set softtabstop=2

" autoload vimrc changes
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" no shift to enter commands, use semicolon
nnoremap ; :
vnoremap ; :

" Disable scracth preview window on autocomplete
set completeopt-=preview

" Modelines are special comments somewhere in a file that can can declare
" certain Vim settings to be used only for that file. 
set modelines=1
" }}}

" Languages {{{
" Markdown

" disable annoying code folding with vim-markdown
let g:vim_markdown_folding_disabled = 1

" enable yaml front matter highlighting in vim-markdown
let g:vim_markdown_frontmatter = 1

" JSX

" highlight jsx in regular .js files
let g:jsx_ext_required = 0

" JSON
let g:vim_json_syntax_conceal = 0 " disable quotes hiding
let g:vim_json_warnings=1 " error warnings

" JsDoc
let g:jsdoc_enable_es6=1

" For Markdown preview
filetype plugin on
" Emoji autocomplete
set completefunc=emoji#complete
" }}}

" UX {{{
" Vim Devicons
set encoding=utf-8
" required if using https://github.com/bling/vim-airline
let g:airline_powerline_fonts=1
" highlight the selected line
set cursorline

" show line numbers
set number
set relativenumber

" turn off search highlight
nnoremap n\ :set number relativenumber<CR>
nnoremap n/ :set nonumber norelativenumbeset nonumber norelativenumber<CR>

" show vertical line
set colorcolumn=100

" indent line
let g:indentLine_color_term = 239

" briefly highlight matching brackets on close/open
set showmatch

" no wrapping
set nowrap

" Allow scrolling past the bottom of the document
set scrolloff=1
 
" tabs!
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
nnoremap te  :tabedit<Space>%<CR>

" set color for folded text, see chart
" https://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg
hi Folded ctermbg=236

" give us 256 color schemes!
set term=screen-256color

" make vim use zsh
set shell=zsh

" don't break mid word
set linebreak
" }}}

"Colors {{{
syntax enable

set t_Co=256

" Color scheme
let g:airline_theme="dracula"
let g:enable_bold_font = 1
set background:dark
colorscheme dracula

" Italic comments
set t_ZH=[3m
set t_ZR=[23m
highlight Comment cterm=italic

" Visual selection colors
hi Visual term=reverse cterm=reverse guibg=Grey

" Search selection colors
hi Search ctermbg=yellow ctermfg=black
" }}}

" Ale linter {{{
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_sign_column_always = 1

" use ctrl-k and ctrl-j for navigating between errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" show ALE in airline
let g:airline#extensions#ale#enabled = 1
" }}}

" CtrlP {{{
" use gitignore for ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
"}}}

" Emmet {{{
let g:user_emmet_leader_key='<C-E>' " c-e-,
" }}}

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

" Gundo {{{
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" }}}

" Macros {{{
let @r="3j0wy$3kP"
" }}}

" MiniBufferExplorer {{{
" map ctrl-l to toggle MiniBufferExplorer
nmap <silent> <C-l> :MBEToggle<CR>
" }}}

" NERDTree {{{
" Highlight Everything
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" Show hidden files
let NERDTreeShowHidden=1

" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" GitGutter
let g:gitgutter_realtime=1
let g:gitgutter_eager=1
set updatetime=1000
" }}}

" Prettier {{{
" map ctrl-k to trigger Prettier
nmap <silent> <C-k> :Prettier<CR>

" prettier
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.graphql,*.css,*.scss,*.less PrettierAsync
" }}}

" Sidebar {{{
" Use control-\ to toggle the sidebar
map <C-\> :NERDTreeToggle<CR>
map <C-> :NERDTreeMirror<CR>
" }}}

" UtilSnippets {{{
" Use ctrl-j to insert a snippet
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsEditSplit="vertical"
" }}}

" vim:foldmethod=marker:foldlevel=0
