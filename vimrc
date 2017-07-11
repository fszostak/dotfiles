" Based on https://gist.github.com/amonks/95fe76e4f843c2355736

set nocompatible

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
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-emoji'
Plug 'fholgado/minibufexpl.vim'

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
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] } 

" Color schemes
Plug 'dracula/vim'

call plug#end()


" " " " " " " " " " " " " " " " " " " " " " " " 
" editor
"
" " " " " " " " " " " " " " " " " " " " " " " " " 

" Buffers
set hidden

" Vim Devicons
set encoding=utf-8
" required if using https://github.com/bling/vim-airline
let g:airline_powerline_fonts=1

" indent line
let g:indentLine_color_term = 239

" default leader key (e.g. vim-easymotion)
let mapleader = ","

" enable scrolling
set mouse=a

" highlight the selected line
set cursorline

" show line numbers
set number
set relativenumber

" show vertical line
set colorcolumn=100

" be more verbose about stuff generally
set showcmd

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

" change default directories
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" use spaces
set shiftwidth=2
set softtabstop=2

" don't break mid word
set linebreak

" autoload vimrc changes
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Use control-\ to toggle the sidebar
map <C-\> :NERDTreeToggle<CR>
map <C-> :NERDTreeMirror<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" no shift to enter commands, use semicolon
nnoremap ; :
vnoremap ; :

" use gitignore for ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" EASYCLIP CLIPBOARD MANAGER
" let g:EasyClipUsePasteToggleDefaults = 0
let g:EasyClipShareYanksFile = '.easyclip'

" ALLOW PASTE OUTSIDE NORMAL MODE
imap <c-v> <plug>EasyClipInsertModePaste
cmap <c-v> <plug>EasyClipCommandModePaste

" ULTISNIPS SNIPPETS

" Use ctrl-j to insert a snippet
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsEditSplit="vertical"

" EMMET
let g:user_emmet_leader_key='<C-E>' " c-e-,

" ALE linter

let g:ale_linters = {'javascript': ['eslint']}
let g:ale_sign_column_always = 1

" use ctrl-k and ctrl-j for navigating between errors 
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" show ALE in airline
let g:airline#extensions#ale#enabled = 1

" prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.css,*.scss,*.less PrettierAsync

" LANGUAGE STUFF

" Markdown

" disable annoying code folding with vim-markdown
let g:vim_markdown_folding_disabled = 1

" enable yaml front matter highlighting in vim-markdown
let g:vim_markdown_frontmatter = 1

" JSX

" highlight jsx in regular .js files
let g:jsx_ext_required = 0

" JSON
let g:vim_json_syntax_conceal = 0

" JsDoc
let g:jsdoc_enable_es6=1

" For Markdown preview
filetype plugin on

" NERDTree

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

" Emoji autocomplete
set completefunc=emoji#complete

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

" COLOR SCHEME
set t_Co=256
let g:airline_theme="dracula"
let g:enable_bold_font = 1
syntax enable
set background:dark
colorscheme dracula
