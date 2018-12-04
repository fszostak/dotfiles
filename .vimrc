"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

let mapleader =" "

call plug#begin('~/.vim/plugged')
" LARBS {{{
Plug 'junegunn/goyo.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'jreybert/vimagit'
" Plug 'vimwiki/vimwiki'
" Plug 'dylanaraps/wal.vim'
"}}}
" Vim UX {{{
" Plug 'SirVer/ultisnips'                " TODO: remove
Plug 'airblade/vim-gitgutter'            " git-gutter
Plug 'Yggdroot/indentLine'               " indent-line
Plug 'flazz/vim-colorschemes'            " for powerline and dracula
Plug 'w0rp/ale'                          " Linter engine
Plug 'vim-airline/vim-airline'           " Airline
Plug 'vim-airline/vim-airline-themes'    " Airline themes
Plug 'fholgado/minibufexpl.vim'          " Buffer explorer
Plug 'sjl/gundo.vim'                     " Undo tree (TODO: learn it or drop it!)
Plug 'tpope/vim-commentary'              " Comments shortcuts (gcc)
Plug 'jbgutierrez/vim-better-comments'   " Better comments UI (coloes)
" }}}
" tmux UX {{{
Plug 'edkolev/tmuxline.vim'
" }}}
" Completion {{{
" Plug 'Valloric/YouCompleteMe' " Autocompletion feature. Follow installation instructions in github
" Plug 'honza/vim-snippets'     " Snippets for multiple languages TODO: remove
" Plug 'mattn/emmet-vim'        " Emmet TODO: remove
Plug 'jiangmiao/auto-pairs'   " Auto pairs
Plug 'tpope/vim-surround'     " Shortcuts to change brackets, quotes, etc in pairs
" Plug 'tpope/vim-unimpaired'   " I use this one only for the {/} + space shortcut
Plug 'heavenshell/vim-jsdoc'  " jsdoc
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
  \ 'do': 'npm install --no-save',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
" }}}
" Color schemes {{{
Plug 'dracula/vim'
" }}}
call plug#end()

" VIM SENSIBLE {{{

" Use <C-L> to clear the highlighting of :set hlsearch.

" if !&scrolloff
"   set scrolloff=1
" endif
" if !&sidescrolloff
"   set sidescrolloff=5
" endif
" set display+=lastline

" if !empty(&viminfo)
"   set viminfo^=!
" endif
" set sessionoptions-=options

" inoremap <C-U> <C-G>u<C-U>
" }}}

" LARBS {{{
" Some basics:
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set cursorline  " not larbs default
	set number
	set relativenumber

	" vim sensible
	set autoindent
	set backspace=indent,eol,start
	set smarttab
	set laststatus=2 " get a window last status (2=always)
	set incsearch " show matches wile searchgin
	set formatoptions+=j " Delete comment character when joining commented lines
	setglobal tags-=./tags tags-=./tags; tags^=./tags;
	set autoread " update content automatically when a file has been modified externaly
	set history=1000 " command history
	set tabpagemax=50
	set nrformats-=octal " what vim will consider numbers when <C-a>(<C-i> in this vimrc case) or <C-x>
	" Allow color schemes to do bright colors without forcing bold.
	if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
	  set t_Co=16
	endif
	" Load matchit.vim, but only if the user hasn't installed a newer version. TODO: verify
	" if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
	"   runtime! macros/matchit.vim
	" endif
	" set complete-=i TODO: verify

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow
	set splitright

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck %<CR>

" View an image for a suckless sent presentation: TODO: verify
	map <leader>v $F@ly$:!feh --scale-down --auto-zoom --image-bg black <c-r>" &<CR><CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Interpret .md files, etc. as .markdown
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Make calcurse notes markdown compatible:
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown

" groff files automatically detected
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom set filetype=groff

" .tex files automatically detected
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Readmes autowrap text:
	autocmd BufRead,BufNewFile *.md set tw=79

" Get line, word and character counts with F3:
	map <F3> :!wc %<CR>

" Spell-check set to F6:
	map <F6> :setlocal spell! spelllang=en_us<CR>

" Use urlview to choose and open a url:
	:noremap <leader>o :w<Home>silent <End> !urlscan<CR>
	:noremap ,, :w<Home>silent <End> !urlscan<CR>

" Goyo plugin makes text more readable when writing prose:
	map <F10> :Goyo<CR>
	map <leader>f :Goyo \| set linebreak<CR>
	inoremap <F10> <esc>:Goyo<CR>a

" Enable Goyo by default for mutt writting
	" Goyo's width will be the line limit in mutt.
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo

" Automatically deletes all tralling whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost ~/.key_directories,~/.key_files !bash ~/.scripts/tools/shortcuts

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Navigating with guides
	" inoremap <Tab><Tab> <Esc>/<++><Enter>"_c4l
	" vnoremap <Tab><Tab> <Esc>/<++><Enter>"_c4l
	" map <Space><Tab> <Esc>/<++><Enter>"_c4l

" TODO: analise:
 "____        _                  _
"/ ___| _ __ (_)_ __  _ __   ___| |_ ___
"\___ \| '_ \| | '_ \| '_ \ / _ \ __/ __|
 "___) | | | | | |_) | |_) |  __/ |_\__ \
"|____/|_| |_|_| .__/| .__/ \___|\__|___/
              "|_|   |_|

"""LATEX
	" Word count:
	autocmd FileType tex map <F3> :w !detex \| wc -w<CR>
	autocmd FileType tex inoremap <F3> <Esc>:w !detex \| wc -w<CR>
	" Compile document using xelatex:
	autocmd FileType tex inoremap <F5> <Esc>:!xelatex<space><c-r>%<Enter>a
	autocmd FileType tex nnoremap <F5> :!xelatex<space><c-r>%<Enter>
	" Code snippets
	autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
	autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
	autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
	autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
	autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
	autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
	autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i
	autocmd FileType tex inoremap ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
	autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
	autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,li <Enter>\item<Space>
	autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
	autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
	autocmd FileType tex inoremap ,can \cand{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,v \vio{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i
	autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
	autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
	autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,bt {\blindtext}
	autocmd FileType tex inoremap ,nu $\varnothing$
	autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
	autocmd FileType tex inoremap ,rn (\ref{})<++><Esc>F}i

"""HTML
	autocmd FileType html inoremap ,b <b></b><Space><++><Esc>FbT>i
	autocmd FileType html inoremap ,it <em></em><Space><++><Esc>FeT>i
	autocmd FileType html inoremap ,1 <h1></h1><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,2 <h2></h2><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,3 <h3></h3><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,p <p></p><Enter><Enter><++><Esc>02kf>a
	autocmd FileType html inoremap ,a <a<Space>href=""><++></a><Space><++><Esc>14hi
	autocmd FileType html inoremap ,e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
	autocmd FileType html inoremap ,ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
	autocmd FileType html inoremap ,li <Esc>o<li></li><Esc>F>a
	autocmd FileType html inoremap ,ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
	autocmd FileType html inoremap ,im <img src="" alt="<++>"><++><esc>Fcf"a
	autocmd FileType html inoremap ,td <td></td><++><Esc>Fdcit
	autocmd FileType html inoremap ,tr <tr></tr><Enter><++><Esc>kf<i
	autocmd FileType html inoremap ,th <th></th><++><Esc>Fhcit
	autocmd FileType html inoremap ,tab <table><Enter></table><Esc>O
	autocmd FileType html inoremap ,gr <font color="green"></font><Esc>F>a
	autocmd FileType html inoremap ,rd <font color="red"></font><Esc>F>a
	autocmd FileType html inoremap ,yl <font color="yellow"></font><Esc>F>a
	autocmd FileType html inoremap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
	autocmd FileType html inoremap ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
	autocmd FileType html inoremap &<space> &amp;<space>
	autocmd FileType html inoremap á &aacute;
	autocmd FileType html inoremap é &eacute;
	autocmd FileType html inoremap í &iacute;
	autocmd FileType html inoremap ó &oacute;
	autocmd FileType html inoremap ú &uacute;
	autocmd FileType html inoremap ä &auml;
	autocmd FileType html inoremap ë &euml;
	autocmd FileType html inoremap ï &iuml;
	autocmd FileType html inoremap ö &ouml;
	autocmd FileType html inoremap ü &uuml;
	autocmd FileType html inoremap ã &atilde;
	autocmd FileType html inoremap ẽ &etilde;
	autocmd FileType html inoremap ĩ &itilde;
	autocmd FileType html inoremap õ &otilde;
	autocmd FileType html inoremap ũ &utilde;
	autocmd FileType html inoremap ñ &ntilde;
	autocmd FileType html inoremap à &agrave;
	autocmd FileType html inoremap è &egrave;
	autocmd FileType html inoremap ì &igrave;
	autocmd FileType html inoremap ò &ograve;
	autocmd FileType html inoremap ù &ugrave;


""".bib
	autocmd FileType bib inoremap ,a @article{<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>journal<Space>=<Space>"<++>",<Enter><tab>volume<Space>=<Space>"<++>",<Enter><tab>pages<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>8kA,<Esc>i
	autocmd FileType bib inoremap ,b @book{<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>publisher<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>6kA,<Esc>i
	autocmd FileType bib inoremap ,c @incollection{<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>booktitle<Space>=<Space>"<++>",<Enter><tab>editor<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>publisher<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>8kA,<Esc>i

"MARKDOWN
	autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
	autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
	autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
	autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
	autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
	autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
	autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
	autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO

""".xml
	autocmd FileType xml inoremap ,e <item><Enter><title><++></title><Enter><guid<space>isPermaLink="false"><++></guid><Enter><pubDate><Esc>:put<Space>=strftime('%a, %d %b %Y %H:%M:%S %z')<Enter>kJA</pubDate><Enter><link><++></link><Enter><description><![CDATA[<++>]]></description><Enter></item><Esc>?<title><enter>cit
	autocmd FileType xml inoremap ,a <a href="<++>"><++></a><++><Esc>F"ci"

vmap <expr> ++ VMATH_YankAndAnalyse()
nmap ++ vip++

vnoremap K xkP`[V`]
vnoremap J xp`[V`]
vnoremap L >gv
vnoremap H <gv

map <enter><enter> yi[:e <c-r>"<cr>
"}}}

" MISC {{{
" Buffers
set hidden
" Error bells
set noerrorbells
" Increment/decrement alternatives
" C-a is a tmux custom reserved shortcut
nnoremap <C-i> <C-a>
" Use dot (.) with visual mode
vnoremap . :norm.<CR>
" Redraw only when we need to
set lazyredraw
" Toggle paste
nnoremap p\ :set paste<CR>
nnoremap p/ :set nopaste<CR>
" Enable scrolling
set mouse=a
" Be more verbose about stuff generally
set showcmd
" Change default directories
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
" Use spaces
set shiftwidth=2
set softtabstop=2
" Autoload vimrc changes
augroup myvimrc
  au!
  au BufWritePost .vimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
" Allow saving of files as sudo when forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
" No shift to enter commands, use semicolon
nnoremap ; :
vnoremap ; :
" Disable scratch preview window on autocomplete
set completeopt=longest,menuone,preview
" set completeopt-=preview
set pumheight=15
" Modelines
" Modelines are special comments somewhere in a file that can can declare
" certain Vim settings to be used only for that file.
set modelines=1
" Map Esc to jk
inoremap jk <Esc>
" Don't split left nor above
set splitright
set splitbelow
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
" filetype plugin on " repeated line
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
" Syntaxes for unknown file extensions {{{
autocmd BufNewFile,BufRead *.php set syntax=php
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
" Visual selection colors {{{
hi Visual term=reverse cterm=reverse guibg=Grey
" }}}
" Search selection colors {{{
hi Search ctermbg=yellow ctermfg=black
" }}}
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
" Fold {{{
" Mappings to foldmethod
nnoremap fms :set foldmethod=syntax<CR>
nnoremap fmm :set foldmethod=manual<CR>
" }}}
" Macros {{{
let @d="A !done j" " done => for todos syntax
let @h="I[Hotfix] " " hotfix => for git flow with emojis
let @i="10I  " " indent => for todos syntax
let @l="A !cancelled j" " cancelled => for todos syntax
let @n="o\\_ " " new line => for todos syntax
let @r="3j0wy$3kP" " set tag version => for git fow
let @s="I[Ship] " " shiop => for git flow
let @t="I:rocket: " " rocket => for git flow with emojis
" }}}
" Navigation {{{
let g:netrw_banner = 0
let g:netrw_liststyle = 3
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
nmap <silent> <leader>l :MBEToggle<CR>
" }}}
" Prettier {{{
" map ctrl-h to trigger Prettier
nmap <silent> <C-h> :Prettier<CR>

" max line length that prettier will wrap on
" Prettier default: 80
let g:prettier#config#print_width = 80

" number of spaces per indentation level
" Prettier default: 2
let g:prettier#config#tab_width = 2

" use tabs over spaces
" Prettier default: false
let g:prettier#config#use_tabs = 'false'

" print semicolons
" Prettier default: true
let g:prettier#config#semi = 'true'

" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'true'

" print spaces between brackets
" Prettier default: true
let g:prettier#config#bracket_spacing = 'false'

" put > on the last line instead of new line
" Prettier default: false
let g:prettier#config#jsx_bracket_same_line = 'true'

" avoid|always
" Prettier default: avoid
let g:prettier#config#arrow_parens = 'avoid'

" none|es5|all
" Prettier default: none
let g:prettier#config#trailing_comma = 'all'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown
" Prettier default: babylon
let g:prettier#config#parser = 'flow'

" cli-override|file-override|prefer-file
let g:prettier#config#config_precedence = 'file-override'

" always|never|preserve
let g:prettier#config#prose_wrap = 'preserve'
" }}}
" UtilSnippets {{{
" Use ctrl-j to insert a snippet
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsEditSplit="vertical"
" }}}
" YouCompleteMe {{{
" let g:ycm_complete_in_comments = 1                          " Use ycm in comments
" let g:ycm_collect_identifiers_from_comments_and_strings = 1 " Get words from comments and strings
" }}}
" }}}

" Autocompletion (default) {{{
set complete=.,b,u,]               " In the above example it will pull from keywords in the current file, other buffers (closed or still open), and from the current tags file
set wildmode=longest,list:longest  " Read https://robots.thoughtbot.com/vim-you-complete-me
set completeopt=menu,preview       " Default menu
imap <Tab> <C-P>
"}}}

" https://www.youtube.com/watch?v=XA2WjJbmmoM&t=1666s
" search down into subfolders

" provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" vim:foldmethod=marker:foldlevel=0
