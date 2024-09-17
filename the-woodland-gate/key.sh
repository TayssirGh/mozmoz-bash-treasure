#!/bin/bash

chest_file="chest.txt"
RED='\033[1;31m'
YELLOW='\033[\0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

chest_content="
      ${BLUE}---------------------------${YELLOW}-------------------------------${RED}---------------------------${NC}
      # You have discovered the Amulet of Color!                                          #
      #                                                                                   #
      # To activate it, attach it to your torch with:                                     #
      # ${RED}--color=always${NC}                                                                    #
      #                                                                                   #
      # For convenience, set an alias like this:                                          #
      # ${RED}alias ls='ls --color=always' ${NC}                                                     #
      #                                                                                   #
      # From now on, scripts, files, and directories will be displayed in vibrant colors. #
      #                                                                                   #
      # Isn’t that cool?                                                                  #
      #                                                                                   #
      ${BLUE}---------------------------${YELLOW}-------------------------------${RED}---------------------------${NC}
"

echo -e "$chest_content" > "$chest_file"

cat $chest_file
mv .first_glade first_glade 2>/dev/null
