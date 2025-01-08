# Number Guessing Game - Final Exam #5

[View full path here](https://github.com/RCYGM/relational-database-projects)

This project demonstrates my ability to design, manage, and query a relational database using PostgreSQL and Bash. The goal is to create a program that allows users to guess a randomly generated secret number between 1 and 1000. Throughout this project, my skills in task automation, user interaction, and strong version control practices were evaluated.

---

## **Requirements Completed**

### **Initial Setup**

1. **Creating the Folder and Main File:**

   - The `number_guessing_game` folder was created within the project directory.
   - Inside this folder, the `number_guess.sh` file was created and assigned execution permissions using `chmod +x number_guess.sh`.

2. **Git Repository:**

   - A Git repository was initialized in the project folder using `git init`.

3. **Commit Structure:**
   - Commits were clear and descriptive, following best practices with prefixes like `fix:`, `feat:`, `refactor:`, and `test:`.
   - Examples:
     - `Initial commit`
     - `feat: created script to handle user input and database queries`
     - `fix: corrected SQL syntax for user data insertion`
     - `test: tested number_guess.sh script functionality`

---

### **Database**

1. **Database Creation:**

   - The `number_guess` database was created using PostgreSQL, containing two main tables:
     - **`users`:**
       - `user_id` (primary key).
       - `username` (maximum of 22 characters, unique, and not null).
     - **`game_stats`:**
       - `game_id` (primary key).
       - `user_id` (foreign key referencing the `users` table).
       - `number_of_guesses` (number of attempts made by the user).

2. **Constraint Management:**
   - Constraints such as `UNIQUE` for `username` and `NOT NULL` for critical fields were added.

---

### **Implemented Features**

1. **Random Number Generation:**

   - The program generates a secret number between 1 and 1000 at the start of each session.

2. **User Interaction:**

   - The program prompts for a username and validates if it already exists in the database.
     - If the user exists:
       - It prints:
         ```
         Welcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses.
         ```
     - If the user is new:
       - It prints:
         ```
         Welcome, <username>! It looks like this is your first time here.
         ```

3. **Game Logic:**

   - The user attempts to guess the secret number. Depending on the input:
     - If the number is higher than the secret number:
       ```
       It's lower than that, guess again:
       ```
     - If the number is lower than the secret number:
       ```
       It's higher than that, guess again:
       ```
     - If the input is not an integer:
       ```
       That is not an integer, guess again:
       ```

4. **Final Result:**

   - When the user guesses correctly, the program prints:
     ```
     You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!
     ```
   - The game data (user and number of guesses) is saved to the database.

5. **Bash Automation:**
   - A Bash script handles SQL queries, game logic, and user interaction.

---

### **Final Project State**

1. **Complete Functionality:**

   - The script works correctly, covering all the test cases specified.
   - All database and user interactions are handled robustly.

2. **Repository Structure:**

   - The project folder includes:
     - `number_guess.sh` (main script).
     - Necessary files to rebuild the database, such as `number_guess.sql`.

3. **Project Cleanliness:**
   - No uncommitted changes exist in the repository. The working tree is clean.
