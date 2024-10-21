## Gameplay [WIP]

The gameplay flow of WordParty.co can be visualized as follows:

```mermaid
sequenceDiagram
    actor GO as Game Owner
    actor F as Friends
    participant S as Server
    participant G as Game/:game_id
    participant R as Rounds/:number

    GO->>S: Create game
    S-->>GO: Return game_id and invite code
    GO->>F: Send invite code
    F->>S: Join game with invite code
    S-->>F: Add to game lobby
    GO->>S: Start game
    S->>G: Initialize game
    loop Each Round
        G->>R: Start new round
        S-->R: select word
        R->>GO: Prompt for clues
        GO->>R: Submit clues
        R->>F: Display clues
        loop Until correct guess or time's up
            F->>R: Submit guess
            R->>R: Evaluate guess
            alt Correct guess
                R->>F: Notify correct guess
                R->>G: End round
            else Incorrect guess and time left
                R->>F: Prompt for another guess
            end
        end
        G->>R: Check round status
        alt Time's up
            R->>G: End round
        end
        alt More rounds left
            G->>R: Start next round
        else No more rounds
            G->>S: End game
        end
    end
    S->>GO: Display final scores
    S->>F: Display final scores
```

### Gameplay Flow Explanation:

1. **Game Creation**: The Game Owner creates a new game on the server.
2. **Invitation**: The server provides a game_id and invite code, which the Game Owner shares with friends.
3. **Joining**: Friends use the invite code to join the game lobby.
4. **Game Start**: The Game Owner initiates the game, moving to the game/:game_id path.
5. **Rounds**: For each round (at game/:game_id/rounds/:number):
   a. The Game Owner selects a word.
   b. The Game Owner provides clues for the word.
   c. Friends attempt to guess the word.
   d. Guesses are evaluated until a correct guess is made or time runs out.
6. **Game End**: After all rounds, the game ends, and final scores are displayed to all players.

This sequence shows the flow from game creation through multiple rounds of play, emphasizing the role of the Game Owner in starting the game and managing each round. The diagram also illustrates the interaction between players, the game instance, and individual rounds.
