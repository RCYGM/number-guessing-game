#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USER_SELECT=$($PSQL "SELECT user_id, username, games_played, number_of_guesses FROM users INNER JOIN game_stats USING(user_id) WHERE username ILIKE '$USERNAME'")
echo "$USER_SELECT"

USER_ID=$(echo "$USER_SELECT" | cut -d '|' -f 1)
EXTRACTED_USERNAME=$(echo "$USER_SELECT" | cut -d '|' -f 2)

if [[ -z $EXTRACTED_USERNAME ]]; then
  EXTRACTED_USERNAME=$USERNAME
fi

USERNAME=$EXTRACTED_USERNAME

GAMES_PLAYED=$(echo "$USER_SELECT" | cut -d '|' -f 3)
BEST_GAME=$(echo "$USER_SELECT" | cut -d '|' -f 4)
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

      GAMES_PLAYED=$(($GAMES_PLAYED + 1))
      $PSQL "INSERT INTO game_stats (user_id, games_played, number_of_guesses) VALUES ($USER_ID, $GAMES_PLAYED, $NUMBER_OF_GUESSES)"

    elif [[ $NUMBER -gt $SECRET_NUMBER ]]; then
      NUMBER_GUESS "It's lower than that, guess again:"
    else
      NUMBER_GUESS "It's higher than that, guess again:"
    fi
  else
    NUMBER_GUESS "That is not an integer, guess again:"
  fi
}

if [[ -z $USER_SELECT ]]; then

  $PSQL "INSERT INTO users(username) VALUES('$USERNAME')"
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username ILIKE '$USERNAME'")
  # $PSQL "INSERT INTO game_stats(user_id) VALUES($USER_ID)"

  #  USER_SELECT=$($PSQL "SELECT user_id, username, games_played, best_game FROM users INNER JOIN game_stats USING(user_id) WHERE username ILIKE '$USERNAME';")

  #  echo "$USER_SELECT"

  # USER_ID=$(echo "$USER_SELECT" | cut -d '|' -f 1)
  #  USERNAME=$(echo "$USER_SELECT" | cut -d '|' -f 2)
  #  GAMES_PLAYED=$(echo "$USER_SELECT" | cut -d '|' -f 3)
  # BEST_GAME=$(echo "$USER_SELECT" | cut -d '|' -f 4)

  # echo "USER_ID, $USER_ID"
  # echo "USERNAME, $USERNAME"
  # echo "GAMES_PLAYED, $GAMES_PLAYED"
  # echo "BEST_GAME, $BEST_GAME"
  # echo "NUMBER_OF_GUESSES, $NUMBER_OF_GUESSES"

  echo "Welcome, $USERNAME! It looks like this is your first time here."
  NUMBER_GUESS
else
  echo "USER_ID, $USER_ID"
  echo "USERNAME, $USERNAME"
  echo "GAMES_PLAYED, $GAMES_PLAYED"
  echo "BEST_GAME, $BEST_GAME"
  echo "NUMBER_OF_GUESSES, $NUMBER_OF_GUESSES"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  NUMBER_GUESS
fi
