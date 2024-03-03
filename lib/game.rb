
require_relative 'board'
require_relative 'player'
require_relative 'element'

class Game

  def initialize()
    @board = Board.new
    @players = [Player.new('White', 'white'), Player.new('Black', 'black')]
    start()
  end

  def start
    @board.place_initial_elements
    @board.display_board
  end

  def prompt_move(player)
    puts "#{player.name}, enter your move (e.g. 'a2 a3')"
    move = gets.chomp
    loop do
      break if move.match?(/^[a-h][1-8] [a-h][1-8]$/)
      puts "Invalid move. Please enter a valid move (e.g. 'a2 a3')"
      move = gets.chomp
    end
    from, to = move.split(' ')
    from = [8 - from[1].to_i, from[0].ord - 97]
    to = [8 - to[1].to_i, to[0].ord - 97]
    [from, to]
  end

  def play
    current_player = @players[0]
    game_on = true
    while game_on do
      move = prompt_move(current_player)
      if @board.valid_move?(move[0], move[1], current_player)
        @board.move_piece(move[0], move[1])
        @board.display_board
        if check_winner?(current_player)
          puts "#{current_player.name} wins!"
          game_on = false
          break
        end
        current_player = @players.find { |player| player != current_player }
      else
        puts "Invalid move"
      end
    end
  end

  def check_winner?(player)
    #if all player pieces are at the center of the board
    if @board.grid[3][3]&.color == player.color &&
        @board.grid[3][4]&.color == player.color &&
        @board.grid[4][3]&.color == player.color &&
        @board.grid[4][4]&.color == player.color

      return true
    else
      return false
    end
  end

end

game = Game.new
game.play
