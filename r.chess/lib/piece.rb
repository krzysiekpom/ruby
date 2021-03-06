require_relative 'helpers'
require_relative 'constants'

class Piece
  include Helpers
  attr_accessor :color, :unicode, :move_directions

  def initialize(color)
   @color = color
   @unicode = nil
   @move_directions = nil
  end
end

class Pawn < Piece
  attr_accessor :first_move
  
  def initialize(color)
    super
    @unicode = color == "white" ? WHITE_PAWN : BLACK_PAWN
    @move_directions = move_directions
    @first_move = true
  end

  def move_directions
    if @color == "white"
      ["up_left", "up_right", "up", "up_double"] 
    else
      ["down_left", "down_right", "down", "down_double"] 
    end
  end
end

class Rook < Piece
  attr_accessor :unicode

  def initialize(color)
    super
    @unicode = color == "white" ? WHITE_ROOK : BLACK_ROOK
    @move_directions = ["up", "down", "left", "right"]
  end
end

class Knight < Piece
  def initialize(color)
    super
    @unicode = color == "white" ? WHITE_KNIGHT : BLACK_KNIGHT
    @move_directions = ["knight_all"]
  end
end

class Bishop < Piece
  def initialize(color)
    super
    @unicode = color == "white" ? WHITE_BISHOP : BLACK_BISHOP
    @move_directions = ["up_left", "up_right", "down_left", "down_right"]
  end
end

class Queen < Piece
  def initialize(color)
    super
    @unicode = color == "white" ? WHITE_QUEEN : BLACK_QUEEN
    @move_directions = ["up_left", "up_right", "down_left", "down_right", "up", "down", "left", "right"]
  end
end

class King < Piece
  def initialize(color)
    super
    @unicode = color == "white" ? WHITE_KING : BLACK_KING
    @move_directions = ["up_left", "up_right", "down_left", "down_right", "up", "down", "left", "right"]
  end
end