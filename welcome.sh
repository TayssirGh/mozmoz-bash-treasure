#!/bin/bash

welcome_file="welcome"
RED='\033[1;31m'
YELLOW='\033[\1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
welcome_message="
${BLUE}~~~~~~~~~~~~~~~~${YELLOW}~~~~~~~~~~~~~~~~~~~~${RED}~~~~~~~~~~~~~~~~~~~~~~~${NC}
                __
__  _  __ ____ |  |   ____  ____   _____   ____
\ \/ \/ _/ __ \|  | _/ ___\/  _ \ /     \_/ __ \  
 \     /\  ___/|  |_\  \__(  <_> |  Y Y  \  ___/  
  \/\_/  \___  |____/\___  \____/|__|_|  /\___  > 
             \/          \/            \/     \/
                                         

         🧙‍♂️ Welcome, Brave Adventurer! 🧙‍♂️

${BLUE}~~~~~~~~~~~~~~~~${YELLOW}~~~~~~~~~~~~~~~~~~~~${RED}~~~~~~~~~~~~~~~~~~~~~~~${NC}
          The wise wizard Mozmoz greets you warmly.
${BLUE}~~~~~~~~~~~~~~~~${YELLOW}~~~~~~~~~~~~~~~~~~~~${RED}~~~~~~~~~~~~~~~~~~~~~~~${NC}
You have stepped into a grand quest to find the hidden treasure
that lies within the mysterious depths of the Linux directories.
But beware! The path is treacherous, filled with riddles and 
challenges that only the cleverest of minds can solve.
${RED}cd${NC}, ${RED}ls${NC} and ${RED}cat${NC} are all you need to know to start playing,
and ALWAYS READ THE ${RED}GRIMORES${NC} FIRST, THEY CONTAIN IMPORTANT INFO!

May your journey be filled with courage, wisdom, and luck.
${BLUE}~~~~~~~~~~~~~~~~${YELLOW}~~~~~~~~~~~~~~~~~~~~${RED}~~~~~~~~~~~~~~~~~~~~~~~~~${NC}
"
echo -e "$welcome_message" > "$welcome_file"

cat $welcome_file
