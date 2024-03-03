class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, nil) }
  end


  def display_board
    letters = ('a'..'h').to_a
    puts
    puts "    #{letters.join('     ')}" # Print top letters
    @grid.each_with_index do |row, index|
      print "#{8 - index} " # Print left numbers

      row.each_with_index do |element, i|

        if index == 3 && i == 3 || index == 3 && i == 4 || index == 4 && i == 3 || index == 4 && i == 4
          print "\e[44m"
          print "#{element.nil? ? '     ' : " #{element.symbol} "} "
          print "\e[0m"
        else
          print "#{element.nil? ? '  -  ' : " #{element.symbol} "} "
        end
      end

      print " #{8 - index}" # Print right numbers
      puts
    end
    puts "    #{letters.join('     ')}" # Print bottom letters
  end

  def place_initial_elements
    @grid[7][0] = Element.new('fire', 'white')
    @grid[7][1] = Element.new('water', 'white')
    @grid[7][2] = Element.new('earth', 'white')
    @grid[7][3] = Element.new('air', 'white')
    @grid[0][7] = Element.new('fire', 'black')
    @grid[0][6] = Element.new('water', 'black')
    @grid[0][5] = Element.new('earth', 'black')
    @grid[0][4] = Element.new('air', 'black')
  end

  def move_piece(from, to)
    from_x, from_y = from
    to_x, to_y = to
    piece = @grid[from_x][from_y]
    @grid[from_x][from_y] = nil
    @grid[to_x][to_y] = piece
  end

  def valid_move?(from, to, player)
    from_x, from_y = from
    to_x, to_y = to
    piece = @grid[from_x][from_y]
    next_piece = @grid[to_x][to_y]

    return false if piece.nil?
    return false if piece.color != player.color
    return false if to_x < 0 || to_x > 7 || to_y < 0 || to_y > 7
    return false if next_piece && next_piece.color == player.color

    valid_moves = piece.movement_pattern.map{ |move| [from_x + move[0], from_y + move[1]] }

    if next_piece && next_piece.type == piece.captures
      move_piece_to_corner(next_piece)
      return true
    end

    return false if next_piece
    valid_moves.include?([to_x, to_y])
  end

  def move_piece_to_corner(piece)
    #check if corner is empty then move the piece to the corner
    if @grid[0][0].nil?
      @grid[0][0] = piece
    elsif @grid[0][7].nil?
      @grid[0][7] = piece
    elsif @grid[7][0].nil?
      @grid[7][0] = piece
    elsif @grid[7][7].nil?
      @grid[7][7] = piece
    else
      puts "No corner available"
    end
  end


end
