#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read NAME

USER_SELECT=$($PSQL "SELECT user_id, username, games_played, best_game FROM users INNER JOIN game_stats USING(user_id) WHERE username ILIKE '$NAME';")

SECRET_NUMBER=$((RANDOM % 1000 + 1))

NUMBER_GUESS() {

  echo "$SECRET_NUMBER"

  if [[ $1 ]]; then
    echo -e "\n$1"
  fi

  NUMBER_OF_GUESSES=$BEST_GAME
  NUMBER_OF_GAMES=$GAMES_PLAYED

  echo -e "\nGuess the secret number between 1 and 1000:"
  read NUMBER
  if [[ $NUMBER =~ ^[0-9]+$ ]]; then

    NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))
    NUMBER_OF_GAMES=$(($NUMBER_OF_GAMES + 1))

    if [[ $NUMBER == $SECRET_NUMBER ]]; then
      echo -e "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

      UPDATE_GAMES_PLAYED_RESULT=$($PSQL "UPDATE game_stats SET games_played = $NUMBER_OF_GAMES  WHERE user_id = $USER_ID;")

      if (($NUMBER_OF_GUESSES < $BEST_GAME)); then
        UPDATE_BEST_GAME_RESULT=$($PSQL "UPDATE game_stats SET games_played = $NUMBER_OF_GUESSES  WHERE user_id = $USER_ID;")
      fi

    elif (($NUMBER > $SECRET_NUMBER)); then
      NUMBER_GUESS "It's lower than that, guess again:"
    else
      NUMBER_GUESS "It's higher than that, guess again:"
    fi
  else
    NUMBER_GUESS "That is not an integer, guess again:"
  fi
}

if [[ -z $USER_SELECT ]]; then
  echo "Welcome, $NAME! It looks like this is your first time here."
  NUMBER_GUESS
else
  echo "$USER_SELECT" | while IFS='|' read USER_ID USERNAME GAMES_PLAYED BEST_GAME; do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED, and your best game took $BEST_GAME guesses."
  done
  NUMBER_GUESS
fi
