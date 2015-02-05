module ConnectFour
  describe Board do
    context "#initialize" do
      it "initializes the board with a grid" do
        expect { Board.new(grid: "grid") }.to_not raise_error
      end

      it "sets the grid with seven columns by default" do
        board = Board.new
        expect(board.grid.size).to eq 7
      end

      it "creates an array in each column" do
        board = Board.new
        board.grid.each do |column|
          expect(column).to be_instance_of Array
        end
      end
    end

    context "#grid" do
      it "returns the grid" do
        board = Board.new(grid: [[], [], []])
        expect(board.grid).to eq [[], [], []]
      end
    end

    context "#drop_in" do
      it "drops a token to the bottom of specified column" do
        grid = [[], [], []]
        board = Board.new(grid: grid)
        board.drop_in(1, "something")
        expect(board.grid[1].first).to eq "something"
      end

      it "prevents from dropping a token to a full column" do
        grid = [%w(x x x x x x)]
        board = Board.new(grid: grid)
        expect(board.drop_in(0, "x")).to be false
      end
    end

    context "#game_over" do
      it "returns :winner if winner? is true" do
        board = Board.new
        allow(board).to receive(:winner?) { true }
        expect(board.game_over).to eq :winner
      end

      it "returns :draw if winner? is false and draw? is true" do
        board = Board.new
        allow(board).to receive(:winner?) { false }
        allow(board).to receive(:draw?) { true }
        expect(board.game_over).to eq :draw
      end

      it "returns false if winner? is false and draw? is false" do
        board = Board.new
        allow(board).to receive(:winner?) { false }
        allow(board).to receive(:draw?) { false }
        expect(board.game_over).to eq false
      end

      it "return :draw if no more moves left" do
        grid = [%w(a b a b a b), %w(b a b a b a), %w(a b a b a b)]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :draw
      end

      context "with four neighbouring tokens in grid of the same type" do
        it "returns :winner in column" do
          grid = [%w(a b a a a a)]
          board = Board.new(grid: grid)
          expect(board.game_over).to eq :winner
        end

        it "returns :winner in row" do
          grid = [%w(a b), %w(a b), %w(b b), %w(b b)]
          board = Board.new(grid: grid)
          expect(board.game_over).to eq :winner
        end

        it "returns :winner when in right diagonal" do
          grid = [%w(a a a), %w(b a b b), %w(b a a a), %w(a b a a b)]
          board = Board.new(grid: grid)
          expect(board.game_over).to eq :winner
        end

        it "returns :winner when in left diagonal" do
          grid = [%w(a a b a b), %w(b a a b), %w(b a a a), %w(a b a)]
          board = Board.new(grid: grid)
          expect(board.game_over).to eql :winner
        end
      end
    end
  end
end
