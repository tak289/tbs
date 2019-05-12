# This will loop through a file and joins lines after removing all comments
:loop
N
$ !b loop

s/#[^\n]*//g
s/[[:space:]]\{1,\}/ /g
