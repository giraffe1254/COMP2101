#!/bin/bash
#
# this script implements a guessing game
# it will pick a secret number from 1 to 10
# it will then repeatedly ask the user to guess the number
#     until the user gets it right

# Give the user instructions for the game
cat <<EOF
Let's play a game.
I will pick a secret number from 1 to 10 and you have to guess it.
If you get it right, you get a virtual prize.
Here we go!
EOF

# Pick the secret number and set their default guess to be a wrong answer
secretnum=$((RANDOM % 10 +1))  #save our secret number to compare later
userguess=0

# This loop repeatedly asks the user to guess and tells them if they got the right answer
# Task 1: Test the user input to make sure it is not blank
# Task 2: Test the user input to make sure it is a number from 1 to 10 inclusive
# Task 3: Give them better feedback, telling them if their guess is too low, or too high


for ((i=0;i<4;i++)); do
  read -p "Give me a number from 1 to 10: " userguess
  if [ -z $userguess ]; then echo "It is a blank!"; i=$i-1
  elif [$userguess -gt 10 -o $userguess -lt 1]; then echo "The number should be between 1 and 10"; i=$i-1
  else
    if [ $userguess -eq $secretnum ]; then
      echo "You got it! Have a milkdud."
      exit
    elif [ $userguess -gt $secretnum ]; then echo "It is too high"
    elif [ $userguess -lt $secretnum ]; then echo "It is too low"
    fi
    echo "$((3-i)) attemp(s) left"
  fi
done
echo "you lost"
