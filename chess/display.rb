require "colorize"
require_relative "board.rb"
require_relative "cursor.rb"

class Display
  attr_reader :board
  def initialize
    @board = Board.new
    @cursor = Cursor.new([0, 0], @board)
  end

  def move(new_pos = 1)
    self.render
    loop do
      @cursor.get_input

      selected = false
      while !selected
        if @cursor.get_input
          selected = @board[@cursor.cursor_pos]
        end
      end

      while selected
        if @board[@cursor.cursor_pos].valid_moves.include?(@cursor.get_input)
          @board[@cursor.get_input] = selected
          selected = false
        end
      end

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
          print current_piece.colorize( :background => :light_black )
        end
      end
      print "\n"
    end
  end
end
