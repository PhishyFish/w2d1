require "colorize"
require_relative "board.rb"
require_relative "cursor.rb"

class Display
  def initialize
    @cursor = Cursor.new([0, 0], board)
  end

  def move(new_pos)
  end

  def render
  end
end
