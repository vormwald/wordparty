# WordParty Gameplay and Rules Breakdown

## Objective
- Guess the secret five-letter word before your friends do!

## Game Hosts
- Game Hosts can create multiple Round Games, with a new word for each Round.
- Hosts can invite friends to join the game.
- Hosts choose Game settings such as:
  - The number of letters in the word
  - The number of rounds
  - The time limit for each round


## Gameplay Mechanics

### Word Entry
1. Players enter a five-letter word guess.
2. The game only accepts valid words from its dictionary.
3. Players can use the keyboard on screen or their device keyboard to enter guesses.

### Guess Validation
- Before processing, each guess is checked against a dictionary of valid words.
- If the word is not in the dictionary, the game displays an error message (e.g., "Not in word list") and doesn't count it as an attempt.

### Feedback System
After each valid guess, the game provides familiar feedback:
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
- Players have multiple attempts (default 6) to guess the word correctly.
- The game ends when:
  1. The player guesses the word correctly (win).
  2. The player uses all six attempts without guessing correctly (loss).
  3. The time limit for the round expires (loss).

## Additional Features
1. Statistics tracking:
   - Games played
   - Win percentage
   - Current streak
   - Max streak
2. Guess distribution (histogram of guesses needed to win)
3. Share results feature (generates emoji grid representing guesses)
5. Dark/Light theme toggle
6. Colorblind mode (uses different colors for accessibility)

## Word List Characteristics
- Generally common words
- Plural forms of four-letter words are typically excluded
- Avoids obscure words to keep the game accessible