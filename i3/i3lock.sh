#!/bin/sh

B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#50fa7bff'  # default
T=$D	       # text
W='#ff5555ff'  # wrong
V='#282a36ff'  # verifying

i3lock -ef                \
\
--insidevercolor=$C       \
--ringvercolor=$D         \
\
--insidewrongcolor=$C     \
--ringwrongcolor=$W       \
\
--insidecolor=$B          \
--ringcolor=$D            \
--linecolor=$B            \
--separatorcolor=$D       \
\
--verifcolor=$T        \
--wrongcolor=$T        \
--timecolor=$T            \
--datecolor=$T            \
--keyhlcolor=$V           \
--bshlcolor=$W            \
\
--screen 0                \
--blur 10                 \
--clock                   \
--indicator               \
--timestr="%H:%M:%S"      \
--datestr="%A, %m %d %Y"  \
\
--time-font=hack           \
--date-font=hack           \
\
--veriftext="Wait for it" \
\
--wrongtext="Doh!"        \
\
--timesize=25             \
--datesize=10             \
--layoutsize=30           \
--verifsize=25            \
--wrongsize=25            \
\
--modsize=15		  \
