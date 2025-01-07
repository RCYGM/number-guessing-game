#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read NAME

USER_SELECT=$($PSQL "SELECT user_id, username, games_played, best_game FROM users INNER JOIN game_stats USING(user_id) WHERE username ILIKE '$NAME';")

if [[ -z $USER_SELECT ]]; then
  echo "Welcome, $NAME! It looks like this is your first time here."
else
  echo "$USER_SELECT" | while IFS='|' read USER_ID USERNAME GAMES_PLAYED BEST_GAME; do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED, and your best game took $BEST_GAME guesses."
  done
fi

echo -e "\nGuess the secret number between 1 and 1000:"
read USER_NUMBER
