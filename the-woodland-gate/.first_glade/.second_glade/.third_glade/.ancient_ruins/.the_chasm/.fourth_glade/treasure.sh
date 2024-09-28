#!/bin/bash
chmod +x ./.confetti.sh

./.confetti.sh
echo -e "Congratulations, you are a winner !"
read -p "Please enter your name: " name

google_form_url="https://docs.google.com/forms/d/1K1vmXpG5MgeAQJpREt0xno4Wv90O3yLMVeIGgjQchcg/formResponse"
name_field="entry.1480318677"

curl -s -o /dev/null -X POST -d "$name_field=$name" "$google_form_url"
#curl https://docs.google.com/forms/d/141lXNzfEqwIdEYfE0rlyGKlyP_awSXJKEjATA4D4HPk/formResponse -d ifq -d entry.2050651062=Eureka -d submit=Submit
echo "Thank you, $name! Your submission has been sent! I hope you enjoyed the game 🥰"

