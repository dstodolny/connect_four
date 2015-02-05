module ConnectFour
  class Game
    attr_reader :players, :board, :current_player, :other_player
    
    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def solicit_move
      "#{current_player.name}(#{current_player.token} ): Enter a number between 1 and 7 to make your move"
    end

    def game_over_message
      return "#{current_player.name} won!" if board.game_over == :winner
      return "The game ended in a tie" if board.game_over == :draw
    end

    def play
      puts "#{current_player.name} has randomly been selected as the first player"
      while true
        board.formatted_grid
        puts ""
        puts solicit_move
        loop do
          column = gets.chomp.to_i
          break if board.drop_in(column - 1, current_player.token)
          puts "This column is full. Try again."
        end
        if board.game_over
          puts game_over_message
          board.formatted_grid
          return
        else
          switch_players
        end
      end
    end
  end
end
