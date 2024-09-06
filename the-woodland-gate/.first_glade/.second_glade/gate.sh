#!/usr/bin/env bash

# shellcheck disable=SC2002
lock_val=$(cat secret-door/book-of-knowledge  | wc -l)

cat <<EOF >spell
[0;34m##############[0;33m################[0;31m#################[0m
[0;34m#[0m « cat filename  | wc -l »                   [0;31m#[0m
[0;34m#[0m                                             [0;31m#[0m
[0;34m#[0m There are many ways to count words or lines [0;31m#[0m
[0;34m#[0m                                             [0;31m#[0m
[0;34m#[0m in the shell. This is one of them.          [0;31m#[0m
[0;34m#[0m                                             [0;31m#[0m
[0;34m##############[0;33m################[0;31m#################[0m
EOF

echo -e "This chest is locked!\nYou need the proper key to enter!"

echo "Enter Key value: "
read -r val


if [[ $val != "$lock_val" ]]; then
	echo "Wrong!"
	exit 0
else
	echo "Correct! You found 10 gold coins!"
fi

cat <<EOF >gold
[0;34m####################[0;33m######################[0;31m####################[0m
[0;34m#[0m Here are 10 gold coins.                                     [0;31m#[0m
[0;34m#[0m                                                             [0;31m#[0m
[0;34m#[0m Create a « gold » variable and asign the value of 10 to it. [0;31m#[0m
[0;34m#[0m                                                             [0;31m#[0m
[0;34m#[0m « export gold=10 »                                          [0;31m#[0m
[0;34m#[0m                                                             [0;31m#[0m
[0;34m#[0m You can always check your gold with:                        [0;31m#[0m
[0;34m#[0m                                                             [0;31m#[0m
[0;34m#[0m echo \$gold                                                  [0;31m#[0m
[0;34m####################[0;33m######################[0;31m####################[0m
EOF

mv .third_glade third_glade 2>/dev/null