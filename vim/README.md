vim
====

Includes files which cannot be automatically installed as plugins/bundles via
Vundle (normally, all plugins are listed in [`.vimrc`](../vimrc)).

## Vimrc

This holds it all together - the packages I need, some custom keyboard overrides.

## Vim shortcuts

This is a listing of the keyboard shortcuts I frequently use in Vim. I'm sure these will evolve with time but roughly represent things in order of utility/commonality of use.

- `w`, `q`, and `x`
    - `w` - save
    - `q` - quit
    - `x` - shortcut for `wq` (save and quit)
- `!` force a command (e.g. `q!` to quit without saving)
- `<esc>` - exit INSERT mode, return to COMMAND mode (remapped to `<capslock>` for easier pinky access)
- `hjkl` - replaces the arrow keys by using these for navigation. `h` and `l` are
  easy to remember as left-right due to their relative keyboard location, but 
  `j` and `k` for up-down is less intuitive 
- `w`, `b`, and `e` - navigate by word
    - `w` - move to next Word (first letter)
    - `b` - move to Beginning of word (current word, or if at beginning of word, to beginning of previous word)
    - `e` - move to end of current word (last letter)
- `$` and `^` - navigate within a line  (these are regular expression syntax for beginning/end)
    - `$` - move to end of line
    - `^` - move to beginning of line
- `a`, `i`, `A`, `r` - enter INSERT mode in various positions
    - `i` - "insert" - enter INSERT mode at current cursor position
    - `a` - "after" - enter INSERT mode one character after current cursor position 
    - `A` - "after whole line" - enter INSERT mode at end of current line
    - `r` - "replace" - enter INSERT mode at current cursor postion, replace the character with the next key entered, then return to command mode.
- `d`, `y`, and `p` - cut (delete) / copy (yank) paste 
    - `dd` - delete current line (can press `p` to insert it elsewhere, hence cut-paste)
    - `yy` - copy current line (can press `p` to insert it elsewhere, hence copy-paste) 
    - `D` - delete rest of line (from current character through end of line)
- `u` and `<ctrl>+r` - undo and redo
    - `u` - undo last command
    - `<ctrl>+r` - redo last command
- `/` - search for text
- `%s` - search
    - `%s/<find>/<replace>/gci` - find `<find>` and replace with `<replace>`, taking extreme care to use `\` to escape characters
    - `g` - globally
    - `c` - confirm before replacing
    - `i` - case insensitive


## References

- [Ben Crowder's vim-fu](http://bencrowder.net/files/vim-fu/) - shortcuts organized by category
- Interactive Training
    - [Memrise's VIM course](http://www.memrise.com/course/52903/vim-2) - flashcards to learn vim shortcuts (free)
    - [ShortcutFoo](https://www.shortcutfoo.com) - spaced repetition focused on keyboard shortcut mastery (costs small $)

