#!/usr/bin/env bash

beast_HP=7
wand_damage=5
long_wand_damage=10

has_wand(){
	if [[ $I == "short_wand" ]]; then
		declare -g wand_type="short"
		declare -g damage=$wand_damage
	elif [[ $I == long_wand ]]; then
		declare -g wand_type="long"
		declare -g damage=$long_wand_damage
	else
		echo "Invalid wand type"
		exit 1
	fi
}

remains(){
cat <<EOF > beast_remains

Smelly stinking beast meat!

Nothing worthy here!

EOF
mv .second_glade second_glade 2>/dev/null
}

is_dead(){
	if (( $beast_HP <= 0 )); then
		declare -g beast_is_dead="dead"
	fi
}

echo -e "The beast has $beast_HP HP\n"
echo -e "The beast bites!\n"
echo -e "attack beast? y/n \n"
read -r ans



if [[ $ans == 'y' ]] || [ "$ans" = "Y" ]; then
  has_wand
	echo -e "You attack the beast with your $wand_type wand!\n"
	(( beast_HP -= damage ))
	is_dead
	echo -e "The beast takes $damage damage from your $wand_type wand!\n"
	if [[ $beast_is_dead == "dead" ]]; then
		echo "You killed the beast!"
		remains
		exit 0
	fi
	echo -e "The beast has $beast_HP HP\n"
	echo -e "Attack again? y/n \n"
	read -r ans2
	if [ "$ans2" = "y" ] || [ "$ans2" = "Y" ]; then
		echo -e "You attack the beast with your $wand_type wand!\n"
		(( beast_HP -= damage ))
		is_dead
		if [[ $beast_is_dead == "dead" ]]; then
			echo "You killed the beast!"
			remains
			exit 0
		fi
  	else
    		echo -e "You hesitate, and the beast recovers all of his health!\n"
	fi
elif [ "$ans" = "n" ] || [ "$ans" = "N" ]; then
    echo "He's quite frightening right ?"
else
    echo "Invalid response. Please enter 'y' or 'n'."
fi
