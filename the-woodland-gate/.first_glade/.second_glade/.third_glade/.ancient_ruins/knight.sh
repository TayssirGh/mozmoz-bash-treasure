#!/usr/bin/env bash
BLUE='\033[0;34m'
NC='\033[0m'
wand_damage=5
long_wand_damage=10
knight_HP=50
knight_attack=3
knight_is_dead="alive"
has_wand(){
	if [[ $I == *"long_wand"* ]]; then
		declare -g wand_type="long"
		declare -g damage=$long_wand_damage
	elif [[ $I == *"short_wand"* ]]; then
		declare -g wand_type="short"
		declare -g damage=$wand_damage
	else
		echo "Invalid wand type"
		exit 1
	fi
}
is_dead(){
	if (( knight_HP <= 0 )); then
		declare -g $knight_is_dead="dead"
		mv .the_chasm the_chasm 2>/dev/null
	fi
}
has_hp(){
  if [[ -z $HP ]]; then
  		echo -e "You must set your HP to play!\n"
  		exit 1
  fi
}
has_gold(){
  if [[ -z $gold ]]; then
  		echo -e "You must set your gold to play!\n"
  		exit 1
  fi
}
knight_gift(){
cat <<EOF > knight_gift
  ____________________________________________________________________
 / \-----     ---------  -----------     -------------- ------    ----\
 \___________________________________________________________________/
 |~ ~~ ~~~ ~ ~ ~~~ ~ _____.----------._ ~~~  ~~~~ ~~   ~~  ~~~~~ ~~~~|
 |  _   ~~ ~~ __,---'[1;31m 1*the-woodland-gate*[0m_ ~~~ _,--. ~~~~ __,---. ~~|
 | | \___ ~~ /      ( )   "          "   '-.,' (') \~~ ~ (  / _\ \~~ |
 |  \    \__/_   __(( _)_      (    "   "     (_\_) \___~ '-.___,'  ~|
 |~~ \     (  )_(__)_|( ))  "   ))          "   |    "  \ ~~ ~~~ _ ~~|
 |  ~ \__ (( _([1;31m*first_glade*[0m  ((      \\//    " |    "    \_____,' | ~|
 |~~ ~   \  ( ))(_)(_)_)|  "    ))    //\\ " __,---._   "  "   "  /~~~|
 |    ~~~ |(_ _)| | |   |   "  (   "      ,-'~~~ ~~~ '-.   ___  /~ ~ |
 | ~~     |  |  [1;31m2*second_glade*-[0m.   _  "  (~~  ~~~~  ~~~ )/___\ \~~ ~|
 |  ~ ~~ /   |      _,----._,''--'\.'-._  '._~~_~__~_,-'  |H__|  \ ~~|
 |~~    / "     _,-' / '\ ,' / _'  \'.- [1;31m3*third_glade*[0m          " \~ |
 | ~~~ / /   .-' , / ' _,'_  -  _ '- _'._ '.'-._    _/- '--.   " " \~|
 |  ~ / / _--[1;31m4*ancient_ruins*[0m--  _,---.  '-._   _,-'- / ' \ \_   " |~|
 | ~ | | -- _    /~/  '-_- _  _,' '  \ \_'-._,-'  / --   \  - \_   / |
 |~~ | \ -      /~~| "     ,-'_ /-  '_ ._'._'-...._____...._,--'  /~~|
 | ~~\  \_ /   /~~/    ___  '---  ---  - - ' ,--.     ___        |~ ~|
 |~   \      ,'~~|  " (o o)   "         " " |~~~ \_,-' ~ '.     ,'~~ |
 | ~~ ~|__,-'~~~~~\    \"/      "  "   "    /~ ~~   O ~ ~~'-.__/~ ~~~|
 |~~~ ~~~  ~~~~~~~~'.______________________/ ~~~    |   [1;31mtreasure[0m     |
 |____~jrei~__~_______~~_~____~~_____~~___~_~~___~\_|_/ ~_____~___~__|
 / \----- ----- ------------  ------- ----- -------  --------  -------\
 \___________________________________________________________________/

EOF
}
pass(){
  mv .hall_chamber hall_chamber 2>/dev/null
}
cat <<EOF
[0;37m
                                       [_]___[_]__[_]___[_]
                                       [__#__][__I_]__I__#]
                                       [_I_#_I__#[__]__#__]
                                          [_]_#_]__I_#_]
                           .-.            [__I_#__I__[_]
                         __|=|__          [_#_[__#_]__#]
                        (_/'-'\_)         [__#_I__[#_I_]
                        //\___/\\          [_I__]__#_I__]
                        <>/   \<>         [#__I__#_]__I]
                         \|_._|/          [_I#__I___I_#]    .:.
                          <_I_>           [#__I__]_#___]   -=o=-
                           |||            [_I__I#__]___]    ':'
                          /_|_\          \\[_]#___][___#],   \|/
                     [0;34m^^^^^^^^^^^^^^^[1;33m^^^^^^^^^^^^^^^^^[1;31m^^^^^^^^^^^^^^^^[0m
Well Hello there traveler , I see you already made it through the past challenges, but don't be so quick it won't be easy for you !
EOF
sleep 3
echo -e "Now if you want to get past me you have two choices either you will fight me or give me all your gold ! "
sleep 4
echo -e "You must've already made your choice "
sleep 1
echo -e "If you chose to fight type ${BLUE}f${NC} and if you chose gold type ${BLUE}g${NC}"
read -r ans
if [[ $ans  == f  ]] || [[ $ans  == F  ]]; then
  has_hp
  has_wand
	echo -e "Okay let's do this !"
  while [[ $knight_HP -gt 10 ]]; do
          echo -e "You attack the knight with your $wand_type wand!\n"
          (( knight_HP -= damage ))
          echo -e "The knight attacked you back .\n"
          ((HP -= knight_attack))
          sleep 2
      done

      echo -e "=================================================="
      echo -e "Your HP is now at $HP."
      echo -e "The knight's HP is now at $knight_HP."
      echo -e "Do you want to finish him off? (y/n)"
      read -r finish_ans

      if [[ $finish_ans == y ]] || [[ $finish_ans == Y ]]; then
          knight_HP=0
          echo -e "You killed the knight! He is now dead.\n"
          is_dead
      else
          echo -e "You spared the knight! He appreciates your mercy and offers you a gift.\n"
          knight_gift
          hall_chamber
      fi
elif [ "$ans" == g ]; then
  echo "Keeping it simple huh ?"
  ((gold -= 10))
  hall_chamber
else
  echo "Your answer is invalid"
fi