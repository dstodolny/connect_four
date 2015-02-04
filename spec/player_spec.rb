module ConnectFour
  describe Player do
    context "#initialize" do
      it "raises an exception when initialized with {}" do
        expect { Player.new({}) }.to raise_error
      end

      it "does not raise an error when initialized with a valid input hash" do
        expect { Player.new(name: "Dominik", token: "\u25cf") }.to_not raise_error
      end
    end

    context "#name" do
      it "return the player's name" do
        player = Player.new(name: "Dominik")
        expect(player.name).to eq "Dominik"
      end
    end

    context "#token" do
      it "returns white token by default" do
        player = Player.new(name: "Dominik")
        expect(player.token).to eq "\u25cb"
      end

      it "returns the player's token" do
        player = Player.new(name: "Dominik", token: "\u25cf")
        expect(player.token).to eq "\u25cf"
      end
    end
  end
end
