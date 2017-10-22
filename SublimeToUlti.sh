#!/bin/bash

FILE="./IconTabBar.js.sublime-snippet"
TITLE=$(sed '2q;d' $FILE | sed -e 's/<tabTrigger>\(.*\)<\/tabTrigger>/\1/' | sed "s/^[ \t]*//")
DESCRIPTION=$(sed '4q;d' $FILE | sed -e 's/<description>\(.*\)<\/description>/\1/' | sed "s/^[ \t]*//")
echo "snippet $TITLE \"$DESCRIPTION\""
# sed -e '/<content><![CDATA[/,/]]><\/content>/!d' $FILE
sed -e '1,5d' < $FILE | sed '$d' | sed '$d'
echo endsnippet
echo ""
