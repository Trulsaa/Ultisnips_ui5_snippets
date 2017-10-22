#!/bin/bash

TOFILE="./xml_ui5.snippets"

for FILE in ./xml/*; do

  TRIGGER=$(sed '2q;d' $FILE | sed -e 's/<tabTrigger>\(.*\)<\/tabTrigger>/\1/' | sed "s/^[ \t]*//")
  DESCRIPTION=$(sed '4q;d' $FILE | sed -e 's/<description>\(.*\)<\/description>/\1/' | sed "s/^[ \t]*//")
  
  # Create first line with the keyword snippet, the trigger and the description
  echo "snippet $TRIGGER \"$DESCRIPTION\"" >> $TOFILE
  # Get the snippet definition 
  sed -e '1,5d' < $FILE | sed '$d' | sed '$d' >> $TOFILE
  # End the snippet with endsnippet
  echo endsnippet >> $TOFILE
  # New line
  echo "" >> $TOFILE

done
