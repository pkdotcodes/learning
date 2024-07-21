# Basics


### Navigation

* j,k,h,l to move arround (or arrow keys) 
* w to jump to the next word (punctuation considered words)
* W to jump to the next word (spaces separate words)
* b/B to jump to previous word (same difference as w/W)
* e/E to jump to the end of a word (same difference as w/W)
* 0 to go to the beginning of a line
* $ to go to the end of a line
* % on {} to jump to closing } for example
* t/T to jump before pressed character
* f/F to jump on presssed character
* after f ; next instance and , previous instance
* gg to go to top of file
* G to go to bottom of file
* {} to jump blocks of code
* 15G or 15gg to jump to line number 15 or :lineNumber 

### Normal Mode
* i insert before cursor
* I insert beginning of the line
* a inster after cursor
* A inster after end of line
* o insert line below current line
* O inster line above current line 

* dd to delete line
* D to delete from cursor up until the end
* cc deletes text and enters insert mode 
* C to delete from cursor up until the end and enters insert mode
* yy to copy line
* p to paste after line 
* P to paste before line
* r to replace character

#### Undo/Redo
* Undo: u
* Redo: ctr+r
* Works also with numbers e.g. 3u
* repeat command: . (for example diw and then . will repeat it)


### Visual Mode
* v for visual mode
* select text with j,k,h,l
* delete text with: d
* delete text enter insert mode: c
* y for copy (yanking)
* p for pasting (works also with numbers 3p)

### Combining keys in VIM
* In general every keys can be combined, like deleting and changing words or other navigation characters
* Command + Count + Motion
* Jump more lines by pressing e.g. 14j
* Deleting can be combined with w and b, e.g. to delete a word press dw or d2w to delete 2 words
* Deleting word if cursor is between the word: diw (Delete inner word) 
* yiw : yank inner word (copies word)
* ciw : change inner word
* cit : change innter tag (html tag)
* cip : change inner paragraph
* Very useful e.g. print("this is a test") with ci" you can change inner quotation marks, works for any other symbol like ci{ to change something inside curly braces
* Examples ci" or yi" or di"

