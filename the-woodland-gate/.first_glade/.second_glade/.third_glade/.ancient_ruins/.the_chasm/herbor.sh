#!/usr/bin/env bash
RED='\033[1;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
if [[ ! -f ./.herbor_env.sh ]]; then

    cat <<EOF > .herbor_env.sh
#!/usr/bin/env bash
export herbor_memory=3
export liora_health=10
EOF
fi

cat << 'EOF' > herbor_challenge.sh
#!/usr/bin/env bash

source ./.herbor_env.sh

if [[ -z "$herbor_memory" || -z "$liora_health" ]]; then
    echo "Error: Environment variables not found! Please run the setup script."
    exit 1
fi

RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'  # No Color


echo -e "Herbor hands you a tattered scroll with a faded pattern of the recipe:"
echo -e "${YELLOW}Hint: The recipe begins with the letters 'Li' and ends with 'a'${NC}\n"
grep_result=$(grep -o '\bL[^ ]*a\b' recipes)
check_guess() {

    if  grep -q "^$1$" <<< "$grep_result"; then
        echo -e "You did it! The recipe '$1' is the one Herbor had forgotten!"
        echo -e "You quickly recite the words, and Liora's light grows stronger, her glow returning."
        echo "export herbor_memory=3" > .herbor_env.sh
        echo "export liora_health=10" >> .herbor_env.sh
        cd ../.hall_chamber/.fourth_glade || exit
        exit 0
    else
        echo -e "${RED}That's not the correct recipe...${NC}"
    fi

}

while (( herbor_memory > 0 && liora_health > 0 )); do
    echo -e "\nHerbor's memory fades... He grows weaker as Liora's light dims further...$"
    echo -e "${YELLOW}Liora's health: ${liora_health}${NC}"
    echo -e "What is the name of the recipe? You have ${herbor_memory} guesses remaining."
    read -r guess

    check_guess "$guess"

    ((herbor_memory--))
    ((liora_health-=4))

    echo "export herbor_memory=$herbor_memory" > .herbor_env.sh
    echo "export liora_health=$liora_health" >> .herbor_env.sh

    if (( liora_health <= 0 )); then
        echo -e "${RED}Liora's light has faded completely... you have failed.${NC}"
        chmod +x ./.gameover.sh
        ./.gameover.sh
        exit 1
    fi
done




echo -e "${RED}Herbor collapses, his memories lost forever. Liora's light fades with him...${NC}"
EOF

chmod +x herbor_challenge.sh
herbor_file="herbor"
herbor_msg="
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⢦⡀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡿⠇⠠⠤⠐⠈⠁⡄⠐⡄
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡴⠀⠲⠄⢀⠀⠀⠀⠀⠀⠀⠀⠀⢸⢡⡀⠀⠀⠀⠀⠀⠀⠀⠀⢠
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⢃⠔⠁⠄⠀⠀⠈⢱⡀⠀⠀⠀⠀⠀⠀⢸⢨⢁⠀⠀⠀⠀⠀⠀⠀⠀⠘
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠯⢙⣀⢀⠀⢠⠀⣀⠂⡇⠀⠀⠀⠀⠀⠀⠘⣿⣌⣀⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠂⡏⠉⠘⢄⠎⠈⠉⡀⣇⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠀⠈⠉⠈⠓⢄⢠⠃
⠀⠀⠀⠀⠀⠀⠀⢀⡰⡞⠚⠉⠉⠉⢒⠚⠁⠀⠈⢻⡦⢄⣀⠀⢀⣤⡖⠋⣿⠉⠳⡄⠀⠀⠀⠈⠁⠀
⠀⠀⠀⠀⠀⢀⡔⠁⠀⠱⣄⡀⠀⠀⠀⢀⠀⠠⠀⢞⡀⠀⠀⠀⠀⠀⠸⠀⣧⠀⠀⡷⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⡔⠁⠀⠀⠀⠀⣼⣁⡁⢀⠀⢀⡀⠒⣀⡞⠲⠀⠀⢀⣀⣀⣴⠀⣿⣦⠞⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣜⠀⠀⠀⠂⠀⠀⠀⠀⢅⠤⠒⢤⣖⠲⣃⠐⠆⠃⠸⡉⠀⠻⠷⢻⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢶⠢⠤⣀⢰⣧⣀⣀⣀⠀⠀⠀⠀⠀⣁⣀⣀⣀⣀⣤⣤⡇⠀⠀⠀⠸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⡾⠀⠀⠀⣽⡏⠉⠙⠛⠛⠛⣟⢯⠍⠉⠛⡏⠉⠉⠁⠀⢥⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠙⠓⠚⠛⢻⠉⠛⠛⠻⠷⠶⠶⠦⠤⠤⠴⠾⠿⠛⠛⠛⠉⡇⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⡾⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢸⡍⠐⠒⠂⠤⠤⢤⣤⡤⠄⠒⠒⠂⠀⢹⠏⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣷⣶⣶⣶⣶⣶⣏⣀⣹⣶⣶⣶⣶⣾⡿⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢀⠀⠤⠐⠐⣦⣀⣽⣿⣿⣿⣿⣿⠁⠀⠀⣿⣿⣿⣿⣿⣏⠈⠉⡉⠀⠀⣿⣿⠤⠀⡀⠀⠀⠀⠀⠀
⠸⡁⠀⠀⠀⠀⠉⠛⠛⠛⠛⠛⠉⠉⠀⠀⠀⠉⠛⠻⠿⢿⣿⣿⠿⠁⠀⠀⠈⠁⠀⠀⢈⠆⠀⠀⠀⠀
⠀⠈⠁⠐⠂⠤⠤⢀⡀⠀⠀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⠀⢀⣀⠀⠤⠄⠒⠒⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠤⢍⢂⠀⠀⠀⠀⠀⠀
                                      ⠀⠀⠀⠀⠀⠀⠐⢄⡅⢀⠁⠘⠀⠀⠀⠀⠀⠀
                                      ⠀⠀⠀⠀⠀⠀⢠⠍⠀⠈⠈⡇⠀⠀⠀⠀⠀⠀
                                      ⠀⠀⠀⢀⠐⠐⠊⠇⠀⠀⠀⠿⠀⠀⡀⠀⠀⠄
                                      ⠄⠀⠠⣗⠔⠚⡐⠀⠀⢀⢐⠃⠀⠠⠀⠀⠀⢤
                                      ⠉⠀⢈⠂⡐⠀⢈⢀⡄⠃⡁⠛⠀⠀⠀⠀⠀⠀
                                      ⠀⠀⠀⢠⠀⠘⠨⣈⠄⠀⠀⠀
  ${BLUE}~~~~~~~~~~~~~~~~~~~~~~~~~${YELLOW}~~~~~~~~~~~~~~~~~~~~~~~~~~~~${RED}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}
  As you step into the depths of the Chasm, a figure emerges from the shadows...
  Herbor, a forgotten warrior, stands before you.
  Beside him lies Liora, an ethereal butterfly-like creature, her light flickering weakly.⠀⠀
  Herbor speaks, his voice weary:
  'I have forgotten the name of the recipe that can save her...
  All I can remember is its pattern, hidden in these ancient texts.Can you help me?
  You must, before Liora's light fades completely.'
  ${BLUE}~~~~~~~~~~~~~~~~~~~~~~~~~${YELLOW}~~~~~~~~~~~~~~~~~~~~~~~~~~~~${RED}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}
"
echo -e "$herbor_msg" > "$herbor_file"

#rm -- "$(basename "$0")"