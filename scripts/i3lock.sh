#!/bin/sh

B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#50fa7bff'  # default
T=$D	       # text
W='#ff5555ff'  # wrong
V='#282a36ff'  # verifying

i3lock -ef            \
\
--insidevercolor=$C   \
--ringvercolor=$D     \
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
--keyhlcolor=$V       \
--bshlcolor=$W        \
\
--screen 0            \
--blur 10             \
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
