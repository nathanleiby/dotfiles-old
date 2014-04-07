# Scripts

Scripts I commonly use.

---

Kill Process by Name

kill -9 ps aux | grep gunicorn | awk '{print $2}'

Sed part of a file, specific line from a file

# e.g. "PRINT COLUMN names from a CSV"
sed -n 1p filename
# or "PRINT sample COLUMN values"
sed -n 2p filename

====

: cut is probably the most useful unix command for me
: you can throw in any delimiter you want right
: http://en.wikipedia.org/wiki/Cut_(Unix)
: +1
: there are a lot of alternatives but the good thing about unix command line arguments is that they are super fast
: a lot of people spent years making them super fast
        also if you open up new shell you can run them in parallel
        and use multiple cores
: http://en.wikipedia.org/wiki/Paste_(Unix)
        ooooh. i feel like i could have used this before…
: so cut and paste do for fixed-length fields what awk does for character-delimited fields, huh?
        cool.
: as long as we're on the topic of fun unix commands, try uniq -c | sort -nr to get a sorted word count
