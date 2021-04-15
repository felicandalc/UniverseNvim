" no backward compatibility
set nocompatible

"enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" FINDING FILES:
" Search down into subfolders
" Provides tab-completion for all file-related taks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy
"
" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

" TAG JUMPING:

" Create the 'tags' file (may need to install ctags first)
" NOTE: install ctags if not using GNU.
command! MakeTags !ctags - R.

" NOW WE CAN: 
" - Use ^] to jump to tag under cursor
" - User g^] for amiguous tags
"  Use ^t to jump up the tag stack

" THING TO CONSIDER: 
" - This doesn't help if you want a visual list of tags

" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list

" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-plit/tab
" - check |netrw-brose-maps| for more mappings
