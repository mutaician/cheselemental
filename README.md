# chesemental

## Overview

I wanted to learn how to play chess but I didn't win any game so I decided to create my own game.I challenged myself to create Chesemental, a Board Game based on chess it is a 2-player strategy game where players control pieces representing the four elements: Fire, Water, Earth, and Air. The objective is to move all pieces to the center of the board to win the game.

## Gameplay

In each turn, players can move their pieces according to the unique movement patterns of each element. 
- **Opposing elements** certain elements have natural advatage over others  ![](https://en.wikipedia.org/wiki/Classical_element#/media/File:Four_elements_representation.svg)
  - Fire captures Water
  - Water captures Fire
  - Earth captures Air
  - Air captures Earth
- Non of the elements is removed from the board instead they are moved to the furthest board corners

## Elements and Movement

Each element in the game has its own unique way of moving across the board:

- **Fire**: Moves like a rook in chess, going straight horizontally or vertically, up to 2 squares at a time.
  
- **Water**: Moves like a bishop in chess, sliding diagonally, and then jumping orthogonally (either up, down, left, or right) to the next square.

- **Earth**: Moves like a king in chess, sliding either horizontally, vertically, or diagonally, but only one square at a time.
  
- **Air**: Moves like a knight in chess, first jumping orthogonally (either up, down, left, or right), and then sliding diagonally to the next square.

Each element has its own distinct way of moving, adding strategic depth and variety to the game.


### Controls

Players take turns moving their pieces using the keyboard or mouse.

### Getting Started

1. Clone the repository.
2. Run `bundle install` to install dependencies.
3. Run `ruby lib/game.rb` to start the game.

