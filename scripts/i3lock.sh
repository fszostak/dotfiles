#!/bin/sh

B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#50fa7bff'  # default
T=$D	       # text
W='f8f8f2ff'  # wrong
V='#f1faf8ff'  # verifying

i3lock -ef            \
\
--insidevercolor=$C   \
--ringvercolor=$V     \
\
--insidewrongcolor=$C \
--ringwrongcolor=$W   \
\
--insidecolor=$B      \
--ringcolor=$D        \
--linecolor=$B        \
--separatorcolor=$D   \
\
--textcolor=$T        \
--timecolor=$T        \
--datecolor=$T        \
--keyhlcolor=$W       \
--bshlcolor=$W        \
\
--screen 0            \
--blur 5              \
--clock               \
--indicator           \
--timestr="%H:%M:%S"  \
--datestr="%A, %m %d %Y" \
\
--timefont=hack       \
--datefont=hack       \


# --veriftext="Drinking verification can..."
# --wrongtext="Nope!"
# --textsize=20
# --modsize=10
# etc
