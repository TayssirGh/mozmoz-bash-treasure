#!/usr/bin/env bash

cat <<EOF

There are many poisonous creatures in the lake.

You should be careful where you thread.

Everything can hurt you and everything will!

EOF

is_hurt(){
	if [[ -z $HP ]]; then
		echo -e "You must set your HP to play!\n"
	else
		(( HP -= 5 ))
		echo -e "Fish just poisoned you ! "
		echo -e "Your HP is: $HP \n"
		mv .ancient_ruins ancient_ruins 2>/dev/null
	fi
}
is_hurt

