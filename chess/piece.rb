class Piece
  def initialize
  end

  def to_s
  end

  def empty?
  end

  def symbol
  end

  def valid_moves
  end

  private

  def move_into_check(to_pos)
  end
end

class NullPiece < Piece
  include Singleton
  
  def initialize
  end

  def moves
  end
end

class Pawn < Piece
  def initialize
  end

  def symbol
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
  def initialize
  end

  def symbol
  end

  protected

  def move_diffs
  end
end

class Knight < Piece
  def initialize
  end

  def symbol
  end

  protected

  def move_diffs
  end
end

class Bishop < Piece
  def initialize
  end

  def symbol
  end

  protected

  def move_diffs
  end
end

class Rook < Piece
  def initialize
  end

  def symbol
  end

  protected

  def move_diffs
  end
end

class Queen < Piece
  def initialize
  end

  def symbol
  end

  protected

  def move_diffs
  end
end
