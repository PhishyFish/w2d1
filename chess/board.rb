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

  def in_bounds?(pos)
    row, col = pos
    return true if row < @grid.size && col < @grid.first.size

    false
  end

  def checkmate?
  end

  protected

  def make_starting_grid
    @grid = Array.new(8) { Array.new(8) }

    @grid.each_with_index do |row, row_idx|
      row.map!.with_index do |col, col_idx|
        if row_idx.between?(2, 5)
          NullPiece.instance
        elsif row_idx == 1
          Pawn.new(self, [row_idx, col_idx], :black)
        elsif row_idx == 6
          Pawn.new(self, [row_idx, col_idx], :white)
        elsif row_idx == 0 && (col_idx == 1 || col_idx == 6)
          Knight.new(self, [row_idx, col_idx], :black)
        elsif row_idx == 7 && (col_idx == 1 || col_idx == 6)
          Knight.new(self, [row_idx, col_idx], :white)
        elsif row_idx == 0 && (col_idx == 0 || col_idx == 7)
          Rook.new(self, [row_idx, col_idx], :black)
        elsif row_idx == 7 && (col_idx == 0 || col_idx == 7)
          Rook.new(self, [row_idx, col_idx], :white)
        elsif row_idx == 0 && (col_idx == 2 || col_idx == 5)
          Bishop.new(self, [row_idx, col_idx], :black)
        elsif row_idx == 7 && (col_idx == 2 || col_idx == 5)
          Bishop.new(self, [row_idx, col_idx], :white)
        elsif row_idx == 0 && col_idx == 3
          Queen.new(self, [row_idx, col_idx], :black)
        elsif row_idx == 7 && col_idx == 3
          Queen.new(self, [row_idx, col_idx], :white)
        elsif row_idx == 0 && col_idx == 4
          King.new(self, [row_idx, col_idx], :black)
        else
          King.new(self, [row_idx, col_idx], :white)
        end
      end
    end

    @grid
  end

  def find_king(color)
  end
end
