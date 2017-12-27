class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,3,6], # first column
    [1,4,7], # second column
    [2,5,8], # third column
    [0,4,8], # left diagonal
    [2,4,6] # right diagonal
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    separator_row = "-----------"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts separator_row
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts separator_row
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i-1
  end

  def move(index,character="X")
    @board[index] = character
  end

  def position_taken?(index)
    if (@board[index] == " " || @board[index] == "" || @board[index] == nil)
      false
    elsif (@board[index] == "X" || @board[index] == "O")
      true
    end
  end

  def valid_move?(index)
    if (index.between?(0,8) && !position_taken?(index))
      true
    else
      false
    end
  end

  def turn_count
    counter = 0

    @board.each do |space|
      if (space == "X" || space == "O")
        counter += 1
      end
    end
    counter
  end

  def current_player
    turns = turn_count
    turns.even? ? "X" : "O"
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)

    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end

end
