#!/bin/bash
hint_message="
------------------------------------------------------------------------------
    The cp command copies one file to another, it can also be used
    to rename the copies as the riddle desires (DCR-3, LCR-2, XCR-1)
    And then run this riddle script again for confirmation.
------------------------------------------------------------------------------
"

hint_file=hint
has_gold(){
  if [[ -z $gold ]]; then
  		echo -e "You must set your gold to play!\n"
  		exit 1
  elif [[ $gold -lt 5 ]]; then
      echo -e "You don't have enough gold"
      exit 1
  fi
}
if [[ -e XCR-1 && -e LCR-2 && -e DCR-3 ]]; then
  echo "You have solved the riddle, you may now continue your journey"
  mv .fourth_glade fourth_glade 2>/dev/null
  exit
else
  echo "You can check the ancient_scroll to solve the riddle"
  sleep 4
  echo "Using Ctrl+C can get you back to the user to the shell prompt"
  sleep 1
  echo "But if you're stuck and you need a hint just stay here a little longer"
  sleep 5
  echo "So you are stuck ! do you want to purchase a hint with 5 gold ? (y/n)"
  read ans

  if [[ $ans == y ]] || [[ $ans == Y ]]; then
      has_gold
      ((gold -= 5))
      echo "You now have $gold remaining gold"
      echo -e "$hint_message" > "$hint_file"
      cat $hint_file
  elif [[ $ans == n ]] || [[ $ans == N ]]; then
      echo "You can do it, check the scroll and run this script till you find it!"
  fi
fi



