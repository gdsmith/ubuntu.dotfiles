" Debian system-wide default configuration Vim
set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim72,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after

" my settings
filetype indent on
set autoindent
set ignorecase smartcase
set incsearch
" set nu
set hls

set tabstop=4
" set expandtab
set shiftwidth=4 " or whatever
set smarttab autoindent

set t_Co=256
set background=dark

" Keep some stuff in the history
set history=1000
set virtualedit=onemore

" Backup and swap files
set backup
set backupdir=~/.vim/tmp/
set directory=~/.vim/tmp/

" undoing even after closing the file
" set undofile
" set undodir=~/.vim/undo

" set cursorline                  " highlight current line

set background=dark
call pathogen#infect()
" colorscheme solarized
colorscheme monokai
" let g:monokai_original = 1


" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start	" more powerful backspacing

" Now we set some defaults for the editor
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" modelines have historically been a source of security/resource
" vulnerabilities -- disable by default, even when 'nocompatible' is set
set nomodeline

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" Some Debian-specific things
if has("autocmd")
  " set mail filetype for reportbug's temp files
  augroup debian
    au BufRead reportbug.*		set ft=mail
    au BufRead reportbug-*		set ft=mail
  augroup END
endif

" Set paper size from /etc/papersize if available (Debian-specific)
if filereadable("/etc/papersize")
  let s:papersize = matchstr(readfile('/etc/papersize', '', 1), '\p*')
  if strlen(s:papersize)
    exe "set printoptions+=paper:" . s:papersize
  endif
endif

if has('gui_running')
  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

if executable("launchpad-integration")
  " Launchpad integration
  an 9999.76 &Help.Get\ Help\ Online\.\.\.		:call <SID>LPI("--info")<CR>
  an 9999.77 &Help.Translate\ This\ Application\.\.\.	:call <SID>LPI("--translate")<CR>
  an 9999.78 &Help.Report\ a\ Problem\.\.\.		:call <SID>LPI("--bugs")<CR>
  an 9999.79 &Help.-lpisep-				<Nop>

  fun! s:LPI(opt)
    call system("launchpad-integration --pid " . getpid() . " " . a:opt)
  endfun
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on

	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
		au!

		" For all text files set 'textwidth' to 78 characters.
		autocmd FileType text setlocal textwidth=78

		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		" (happens when dropping a file on gvim).
		" Also don't do it when the mark is in the first line, that is the default
		" position when opening a file.
		autocmd BufReadPost *
					\ if line("'\"") > 1 && line("'\"") <= line("$") |
					\   exe "normal! g`\"" |
					\ endif

	augroup END

else

	set autoindent        " always set autoindenting on

endif " has("autocmd")

