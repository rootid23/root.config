
"1. See the problem
"2. find a solution
"3. use it

"Step 1: Detect inefficiency
"- Find out what you waste time on
"Step 2: Find a quicker way
"- read the on-line help
"- read the quick reference, books, etc.
"- ask friends and colleagues
"- search the internet
"- do it yourself
"Step 3: Make it a habit
"- do it
"- keep on improving


"How not to edit effectively
"  You have to get the text ready right now. No time
"  to read documentation or learn a new command.
"  You will keep on using primitive commands
"
"You want to learn every feature the editor offers
"  and use the most efficient command all the time.
"  You will waste a lot of time learning things you
"  will never use.

:help user-manual

"Searching effciently
:set hlsearch

"Moving quickly with folds amongs files
"Otherwise gf, [I , [<TAB>
"
"Don't type it twice (ctrl-n)/omnicompletion
"
"
"Compile + file naviagtion
"
map _cl :call CleanLint()<CR>
func CleanLint()
  g/gtk_x11.c:.*enum/d
  g/if_perl.*conversion to.*proto/d
endfunc

"After cleanup with _cl you can do :cfile %
"to turn it into an error list.

"Spell checkers
:iabbrev teh the
:syntax keyword WordError teh

"Searching among the files with quickfix
"TODO : Use the global tags 
"https://www.gnu.org/software/global/globaldoc_toc.html#Introduction
":!ctags -R .
":tag init
":tnext
":grep “\<K_HOME\>” **/*.h
":cnext
"
"
"text settings
":set tw=0 wrap linebreak

" vim: set sw=2 nospell :
