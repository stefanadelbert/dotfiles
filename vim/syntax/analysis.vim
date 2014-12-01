syn keyword keywordIN IN
syn keyword keywordOUT OUT
syn keyword keywordSUMMARY SUMMARY
syn keyword keywordTaggedRequest TaggedRequest
syn keyword keywordTaggedResponse TaggedResponse

syn match date /\d\{4}-\d\{2}-\d\{2}/ nextgroup=time skipwhite
syn match time /\d\{2}:\d\{2}:\d\{2}\.\d\{6}/
syn match key /\w\+=/

hi def keywordIN ctermfg=green guifg=green
hi def keywordOUT ctermfg=red guifg=#FF3737
hi def keywordSUMMARY ctermfg=blue guifg=#6393EB
hi def keywordTaggedRequest ctermfg=darkred guifg=#FF3737
hi def keywordTaggedResponse ctermfg=darkgreen guifg=green

hi def date ctermfg=yellow guifg=#FFFF20
hi def time ctermfg=lightyellow guifg=#FFFF80
hi def key ctermfg=darkgrey guifg=#919191
