#!/bin/bash

welcome_file="welcome"
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
welcome_message="
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

__  _  __ ____ |  |   ____  ____   _____   ____
\ \/ \/ _/ __ \|  | _/ ___\/  _ \ /     \_/ __ \  
 \     /\  ___/|  |_\  \__(  <_> |  Y Y  \  ___/  
  \/\_/  \___  |____/\___  \____/|__|_|  /\___  > 
             \/          \/            \/     \/ 
                                         

                 🧙‍♂️ Welcome, Brave Adventurer! 🧙‍♂️

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          The wise wizard Mozmoz greets you warmly.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
You have embarked on a grand quest to find the hidden treasure 
that lies within the mysterious depths of the Linux directories.
But beware! The path is treacherous, filled with riddles and 
challenges that only the cleverest of minds can solve.

  May your journey be filled with courage, wisdom, and luck.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"

echo "$welcome_message" > "$welcome_file"

echo "Welcome file created: $welcome_file"
