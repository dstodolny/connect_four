module ConnectFour
  class Player
    attr_reader :name, :token

    def initialize(input)
      @name = input.fetch(:name)
      @token = input.fetch(:token, "\u25cb")
    end
  end
end
