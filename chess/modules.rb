module Stepable
  def valid_moves
  end

  private

  def move_diffs
  end
end

module Slideable
  def valid_moves
    @valid_moves = []
  end

  private

  def vertical_dirs
    grow_unblocked_moves_in_dir(1, 0)
    grow_unblocked_moves_in_dir(-1, 0)
  end

  def horizontal_dirs
    # Rook, Queen
    grow_unblocked_moves_in_dir(0, 1)
    grow_unblocked_moves_in_dir(0, -1)
  end

  def diagonal_dirs
    # Queen, Bishop
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    x, y = @current_pos
    result = []
    until !@board[[x + dx, y + dy]].is_a?(NullPiece) || !@board.in_bounds?([x + dx, y + dy])
      x += dx
      y += dy
      result << [x, y]
    end
    if @board[[x + dx, y + dy]].color != self.color
      result << @board[[x + dx, y + dy]]
    end

    result
  end
end
