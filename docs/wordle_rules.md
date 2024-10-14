# Wordle Gameplay and Rules Breakdown

## Objective
- Guess the secret five-letter word in six attempts or fewer.

## Game Setup
- A new word is chosen randomly each day.
- The same word is used for all players on a given day.
- Words are reset at midnight local time.

## Gameplay Mechanics

### Word Entry
1. Players enter a five-letter word guess.
2. The game only accepts valid five-letter words from its dictionary.
3. Players can use the keyboard on screen or their device keyboard to enter guesses.

### Guess Validation
- Before processing, each guess is checked against a dictionary of valid words.
- If the word is not in the dictionary, the game displays an error message (e.g., "Not in word list") and doesn't count it as an attempt.

### Feedback System
After each valid guess, the game provides feedback:
- Green: Letter is in the correct position.
- Yellow: Letter is in the word but in the wrong position.
- Gray: Letter is not in the word.

### Keyboard Feedback
- The on-screen keyboard also updates with color coding to show used and correct letters.

### Multiple Instances of Letters
- If the secret word has repeated letters:
  - If a guessed letter appears in the correct position, it's marked green.
  - If there are additional instances of that letter in the incorrect position, they're marked yellow only if the secret word has more instances of that letter.
  - Extra guessed instances of a letter are marked gray if they exceed the count in the secret word.

## Game Progression
- Players have six attempts to guess the word correctly.
- The game ends when:
  1. The player guesses the word correctly (win).
  2. The player uses all six attempts without guessing correctly (loss).

## Additional Features
1. Statistics tracking:
   - Games played
   - Win percentage
   - Current streak
   - Max streak
2. Guess distribution (histogram of guesses needed to win)
3. Share results feature (generates emoji grid representing guesses)
4. Hard Mode option: Forces players to use revealed hints in subsequent guesses
5. Dark/Light theme toggle
6. Colorblind mode (uses different colors for accessibility)

## Time Aspect
- One puzzle per day
- All players worldwide get the same word each day
- Players can only play once per day (the daily puzzle)

## Word List Characteristics
- Generally common five-letter words
- Plural forms of four-letter words are typically excluded
- Avoids obscure words to keep the game accessible