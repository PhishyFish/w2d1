require "singleton"
require_relative "board.rb"
require_relative "modules.rb"
require_relative "display.rb"

class Piece
  attr_reader :valid_moves

  def initialize(board, pos, color)
    @valid_moves = []
    @board = board
    @current_pos = pos
    @color = color
  end

  def to_s
    "P "
  end

  def empty?
  end

  def symbol
  end

  def valid_moves
    @valid_moves = [[2, 0]]
    @valid_moves
  end

  private

  def move_into_check(to_pos)
  end
end

class NullPiece < Piece
  include Singleton

  def initialize
  end

  def to_s
    "  "
  end

  def moves
  end
end

class Pawn < Piece
  def initialize(board, pos, color)
    super(board, pos, color)
  end

  def moves
  end

  protected

  def at_start_row?
  end

  def forward_dir
  end

  def forward_steps
  end

  def side_attacks
  end
end

class King < Piece
  def initialize(board, pos, color)
    super(board, pos, color)
  end

  def to_s
    "^^"
  end

  protected

  def move_diffs
  end
end

class Knight < Piece
  def initialize(board, pos, color)
    super(board, pos, color)
  end

  def to_s
    "K "
  end

  protected

  def move_diffs
  end
end

class Bishop < Piece
  include Slideable
  def initialize(board, pos, color)
    super(board, pos, color)
  end

  def to_s
    "B "
  end

  protected

  def move_diffs
  end
end

class Rook < Piece
  include Slideable
  def initialize(board, pos, color)
    super(board, pos, color)
  end

  def to_s
    "R "
  end

  protected

  def move_diffs

  end
end

class Queen < Piece
  include Slideable
  def initialize(board, pos, color)
    super(board, pos, color)
  end

  def to_s
    "Q "
  end

  protected

  def move_diffs
  end
end
