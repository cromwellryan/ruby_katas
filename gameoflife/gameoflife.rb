class Game
  def initialize
    @board = [ [false, false, false, false, false],
               [false, false, false, true, false],
               [false, false, true, false, false],
               [false, true, false, false, false],
               [false, false, false, false, false]
             ]
  end

  def game_board

    @board.each do |row|
      row_status = ""
      row.each do |piece|
        if piece == true
          row_status << "X"
        else
          row_status << "O"
        end
      end
    # puts row_status
    end
  end

  # Create transitions
  def transition
    @board.each_with_index do |row, y|
      assembled = ""
      row.each_index do |x|
        assembled << find_neighbors(x,y).to_s
      end
       puts assembled
    end
  end

  #finds neighboring elements
  def find_neighbors(x,y)
    truths = 0
    for x_Pos in x-1..x+1
      for y_Pos in y-1..y+1
        if (0...@board.length).include?(x_Pos) && (0...@board[0].length).include?(y_Pos)
          if @board[x_Pos][y_Pos] == true
            truths += 1
          end
        end
      end
    end

    if @board[x][y] == true
      truths -= 1
    end

    return truths

  end
end

game = Game.new
# game.game_board()
game.find_neighbors(2,2)
# game.transition

# what variables go outside the range
# => x_Pos, y_Pos

# for each variable what is their valid range
# => x_Pos within 0 - 4 Board[0].length => x
# => y_Pos within 0 - 4 Board.length => y

# how do you check valid range
# => (0..Board[0].length).include?(x_Pos)
# => (0..Board.length).include?(y_Pos)

#What am I expecting? (definitely not a baby, thank god)
# What do I get?
# Is it what I'm expecting, if not, why? <- Andrew's questions to me. </3
