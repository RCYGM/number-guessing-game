#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
# $PSQL "TRUNCATE users CASCADE"
echo "Enter your username:"
read USERNAME

if [[ -z $USERNAME ]]; then
  echo "Username cannot be empty."
  exit 1
fi

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

# Validate if the user exists
if [[ -z $USER_ID ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) AS best_game FROM game_stats WHERE user_id=$USER_ID")
  GAMES_PLAYED=$($PSQL "SELECT COUNT(user_id) FROM game_stats WHERE user_id = $USER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

NUMBER_OF_GUESSES=0

SECRET_NUMBER=$((RANDOM % 1000 + 1))
# echo "$SECRET_NUMBER"

echo "Guess the secret number between 1 and 1000:"
read NUMBER

while [ "$NUMBER" -ne "$SECRET_NUMBER" ]; do
  # Validate if the input is a number only
  if [[ $NUMBER =~ ^[0-9]+$ ]]; then

    # Add attempts in each iteration
    NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))

    # And if the number is correct, proceed to insert the data
    if [[ $NUMBER -gt $SECRET_NUMBER ]]; then
      NUMBER_GUESS "It's lower than that, guess again:"
    else
      NUMBER_GUESS "It's higher than that, guess again:"
    fi
  else
    echo "That is not an integer, guess again:"
  fi
  read NUMBER
done

# Add attempts in each iteration
NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))

# Create the user if it is their first game before inserting the data
if [[ -z $USER_ID ]]; then
  $PSQL "INSERT INTO users(username) VALUES('$USERNAME')" >/dev/null 2>&1
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username ILIKE '$USERNAME'")
fi
# Insert the game data and print the final message
$PSQL "INSERT INTO game_stats (user_id, number_of_guesses) VALUES ($USER_ID, $NUMBER_OF_GUESSES)" >/dev/null 2>&1
echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
