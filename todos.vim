" Vim syntax file
" Language: Personal Todos
" Maintainer: Gustavo Tonietto
" Latest Revision: 07 November 2018

if exists("b:current_syntax")
  finish
endif

syn case ignore

syn match todoComment	"# .*$" contains=todoContext
syn match todoProject	/^.\+:  / contains=todoContext
syn match todoListItem	/^.*\s\\_\(\(\s\|([^)]*)\).*\)\?$/
syn match todoContext	/\s\zs@[^ \t(]\+\(([^)]*)\)\?/

syn sync fromstart

"highlighting for todo groups
hi def link todoListItem      Statement
hi def link todoContext       Identifier
hi def link todoProject       Title
hi def link todoComment       Comment

let b:current_syntax = "todos"

" vim: ts=8
