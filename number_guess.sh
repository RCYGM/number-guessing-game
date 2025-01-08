#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
# $PSQL "TRUNCATE users CASCADE"
echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

if [[ -z $USER_ID ]]; then
  BEST_GAME=0
else
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) AS best_game FROM game_stats WHERE user_id=$USER_ID")
fi

GAMES_PLAYED=$($PSQL "SELECT COUNT(user_id) FROM game_stats WHERE user_id = $USER_ID")

NUMBER_OF_GUESSES=0

SECRET_NUMBER=$((RANDOM % 1000 + 1))
echo "$SECRET_NUMBER"

NUMBER_GUESS() {

  if [[ $1 ]]; then
    echo -e "\n$1"
  fi

  echo -e "\nGuess the secret number between 1 and 1000:"
  read NUMBER

  if [[ $NUMBER =~ ^[0-9]+$ ]]; then

    NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))
    echo "$NUMBER_OF_GUESSES"

    if [[ $NUMBER -eq $SECRET_NUMBER ]]; then
      echo -e "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

      if [[ -z $USER_ID ]]; then
        $PSQL "INSERT INTO users(username) VALUES('$USERNAME')"
        USER_ID=$($PSQL "SELECT user_id FROM users WHERE username ILIKE '$USERNAME'")
      fi

      #GAMES_PLAYED=$(($GAMES_PLAYED + 1))
      $PSQL "INSERT INTO game_stats (user_id, number_of_guesses) VALUES ($USER_ID, $NUMBER_OF_GUESSES)"

    elif [[ $NUMBER -gt $SECRET_NUMBER ]]; then
      NUMBER_GUESS "It's lower than that, guess again:"
    else
      NUMBER_GUESS "It's higher than that, guess again:"
    fi
  else
    NUMBER_GUESS "That is not an integer, guess again:"
  fi
}

if [[ -z $USER_ID ]]; then
  NUMBER_GUESS "Welcome, $USERNAME! It looks like this is your first time here."
else
  NUMBER_GUESS "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
