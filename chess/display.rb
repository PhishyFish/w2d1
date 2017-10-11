require "colorize"
require_relative "board.rb"
require_relative "cursor.rb"

class Display
  attr_reader :board
  def initialize
    @board = Board.new
    @cursor = Cursor.new([0, 0], @board)
  end

  def move(new_pos)
    loop do
      @cursor.get_input
      system("clear")
      self.render
    end
  end

  def render
    @board.grid.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        # if @board[row_idx, col_idx]
        current_piece = @board[[row_idx, col_idx]].to_s
        if [row_idx, col_idx] == @cursor.cursor_pos
          print current_piece.colorize( :background => :green )
        elsif (col_idx.odd? && row_idx.odd?) || (col_idx.even? && row_idx.even?)
          print current_piece.colorize( :background => :light_white )
        else
          print current_piece.colorize( :background => :black )
        end
      end
      print "\n"
    end
  end
end
