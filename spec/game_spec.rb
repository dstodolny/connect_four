module ConnectFour
  describe Game do
    let (:dominik) { Player.new(name: "Dominik", token: "\u25cb") }
    let (:lukasz) { Player.new(name: "Lukasz", token: "\u25cf") }
    let (:game) { Game.new([dominik, lukasz]) }

    context "#initialize" do
      it "randomly selects a current_player" do
        allow_any_instance_of(Array).to receive(:shuffle) { [dominik, lukasz] }
        game = Game.new([lukasz, dominik])
        expect(game.current_player).to eq dominik
      end

      it "randomly selects an other player" do
        allow_any_instance_of(Array).to receive(:shuffle) { [dominik, lukasz] }
        game = Game.new([lukasz, dominik])
        expect(game.other_player).to eq lukasz
      end
    end

    context "#switch_players" do
      it "will set @current_player to @other_player" do
        game = Game.new([lukasz, dominik])
        other_player = game.other_player
        game.switch_players
        expect(game.current_player).to eq other_player
      end

      it "will set @other_player to @current_player" do
        game = Game.new([lukasz, dominik])
        current_player = game.current_player
        game.switch_players
        expect(game.other_player).to eq current_player
      end
    end

    context "#solicit_move" do
      it "asks the player to make a move" do
        game = Game.new([lukasz, dominik])
        allow(game).to receive(:current_player) { lukasz }
        expected = "Lukasz(\u25cf ): Enter a number between 1 and 7 to make your move"
        expect(game.solicit_move).to eq expected
      end
    end

    context "game_over_message" do
      it "returns '{current_player name} won!' if board shows a winner" do
        game = Game.new([lukasz, dominik])
        allow(game).to receive(:current_player) { lukasz }
        allow(game.board).to receive(:game_over) { :winner }
        expect(game.game_over_message).to eq "Lukasz won!"
      end

      it "returns 'The game ended in a tie' if board shows a draw" do
        game = Game.new([lukasz, dominik])
        allow(game).to receive(:current_player) { dominik }
        allow(game.board).to receive(:game_over) { :draw }
        expect(game.game_over_message).to eq "The game ended in a tie"
      end
    end
  end
end
