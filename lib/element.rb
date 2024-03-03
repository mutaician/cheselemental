class Element
  attr_reader :type, :color

  def initialize(type, color)
    @type = type
    @color = color
  end

  def symbol
    s = ""
    if @type == 'fire'
      s = "🔥"
    elsif @type == 'water'
      s = "💧"
    elsif @type == 'earth'
      s = "🌍"
    elsif @type == 'air'
      s = "💨"
    end
    if @color == "white"
      s = "W#{s}"
    else
      s = "B#{s}"
    end
    s
  end


  def movement_pattern
    case @type
    when 'fire' # 1 or 2 squares horizontally or vertically
      [[1, 0], [0, 1], [-1, 0], [0, -1], [2, 0], [0, 2], [-2, 0], [0, -2]]
    when 'water' # 1 square diagonally or (1 square diagonally then 1 square orthogonally)
      [[1, 1], [-1, 1], [1, -1], [-1, -1], [2, 1], [1, 2], [-2, 1], [1, -2], [2, -1], [-1, 2], [-2, -1], [-1, -2]]
    when 'earth' # 1 square orthogonally or diagonally
      [[1, 0], [0, 1], [-1, 0], [0, -1], [1, 1], [-1, 1], [1, -1], [-1, -1]]
    when 'air' # 1 square orthogonally or (1 square orthogonally then 1 square diagonally)
      [[1, 0], [0, 1], [-1, 0], [0, -1], [2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [-1, 2], [1, -2], [-1, -2]]

    end
  end

  def captures
    case @type
    when 'fire'
      'water'
    when 'water'
      'fire'
    when 'earth'
      'air'
    when 'air'
      'earth'
    end
  end

end
