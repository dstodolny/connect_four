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
      "#{current_player.name}: Enter a number between 1 and 7 to make your move"
    end
  end
end
