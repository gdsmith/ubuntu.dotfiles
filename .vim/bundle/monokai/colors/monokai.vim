" Vim color file based on desert
" Maintainer:	George <george@gsgd.co.uk>
" Last Change:	$Date: 2004/06/13 19:30:30 $
" Last Change:	$Date: 2004/06/13 19:30:30 $
" URL:		http://hans.fugal.net/vim/colors/desert.vim
" Version:	$Id: desert.vim,v 1.1 2004/06/13 19:30:30 vimboss Exp $

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="monokai"

hi Cursor           ctermfg=8       ctermbg=white       cterm=reverse
hi LineNr           ctermfg=darkgray    ctermbg=NONE        cterm=NONE
" color terminal definitions
hi SpecialKey	ctermfg=darkgreen
hi NonText	cterm=bold ctermfg=darkblue
hi Directory	ctermfg=darkcyan
hi ErrorMsg	cterm=bold ctermfg=7 ctermbg=1
hi IncSearch	cterm=NONE ctermbg=8
hi Search	cterm=NONE ctermfg=0 ctermbg=11
hi MoreMsg	ctermfg=darkgreen
hi ModeMsg	cterm=NONE ctermfg=brown
hi LineNr	ctermfg=3
hi Question	ctermfg=green
hi StatusLine	cterm=bold,reverse
hi StatusLineNC cterm=reverse
hi VertSplit	cterm=reverse
hi Title	ctermfg=5
hi Visual	cterm=reverse
hi VisualNOS	cterm=bold,underline
hi WarningMsg	ctermfg=1
hi WildMenu	ctermfg=0 ctermbg=3
hi Folded	ctermfg=darkgrey ctermbg=NONE
hi FoldColumn	ctermfg=darkgrey ctermbg=NONE
hi DiffAdd	ctermbg=4
hi DiffChange	ctermbg=5
hi DiffDelete	cterm=bold ctermfg=4 ctermbg=6
hi DiffText	cterm=bold ctermbg=1
hi Comment	ctermfg=11
hi Constant	ctermfg=6
hi String   ctermfg=3
hi Character ctermfg=3
hi Special	ctermfg=1
hi Identifier	ctermfg=7
hi Delimiter	ctermfg=7
hi Statement	ctermfg=5
hi PreProc	ctermfg=5
hi Type		ctermfg=2
hi link StorageClass Statement
hi link Structure Label
hi Underlined	cterm=underline ctermfg=5
hi Ignore	cterm=bold ctermfg=11
hi Label	ctermfg=4
hi Error	cterm=bold ctermfg=0 ctermbg=5

" highlight for PHP
hi link phpFunctions Label
hi link phpVarSelector Identifier
hi link phpIdentifier Identifier
hi link phpRelation Statement
hi link phpStructure Label
hi link phpSpecialFunction Label
hi link phpStorageClass Preproc
hi link phpSpecialFunction Label

"vim: sw=4

