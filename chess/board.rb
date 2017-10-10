require_relative "piece.rb"

class Board
  attr_reader :grid

  def initialize
    @grid = make_starting_grid
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end

  def dup
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]

    raise "Invalid start position" if piece.nil? # NullPiece
    raise "Invalid end position" unless piece.valid_moves.include?(end_pos)
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end

  def checkmate?
  end

  protected

  def make_starting_grid
    @grid = Array.new(8) { Array.new(8) }

    @grid.each_with_index do |row, idx|
      row.map! { |col| Piece.new unless idx.between?(2, 5) }
    end

    @grid
  end

  def find_king(color)
  end
end
