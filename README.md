## Project name: BlackJack - a casino banking game
- There is a player (user) and a dealer (controlled by the program).
- First, we ask the user for a name, after which the game begins.
- At the beginning of the game, the user and the dealer have $100 in the bank
- The user is given random 2 cards 
- Also, 2 random cards are given to the “dealer” against whom the user is playing.
- The user sees the sum of his points. The amount is calculated as follows: from 2 to 10 - at face value of the card, all other cards - 10 each, ace - 1 or 11, depending on which value is closer to 21 and which does not lead to a loss (amount over 21).
- After the deal, a $10 bet is automatically placed into the game pot by both the player and the dealer. (Player and dealer have 10 subtracted from the pot)
- After that, the move passes to the user. The user has 3 options to choose from:
<!-- Way to move -->
    1. Skip. In this case, the turn goes to the dealer
    2. Add a card. (only if the user has 2 cards in his hand).
    3. Open cards. The cards of the dealer and the player are opened, the player sees the sum of the dealer's points, the results of the game are calculated.
- Calculation of results:
<!-- Calculation of results -->
    1. The player with the sum of points closer to 21 wins
    2. If the player's score is more than 21, then he lost
    3. If the total points of the player and the dealer are the same, then a draw is declared and the money from the bank is returned to the players
    4. The amount from the game bank goes to the winner


## Requirements
Ruby: 3.0.3

## How to launch
- Clone the repository
- `ruby game.rb`
