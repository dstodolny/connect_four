module ConnectFour
  class Board
    attr_reader :grid

    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
    end

    def drop_in(column, token)
      return false if grid[column].size == 6
      grid[column] << token
    end

    def game_over
      return :winner if winner?
      return :draw if draw?
      false
    end

    # private

    def default_grid
      Array.new(7) { Array.new }
    end

    def winner?
      pattern = /(.)\1{3}/
      lines.any? { |line| line.join.match(pattern) }
    end

    def lines
      ary = []
      grid.each { |line| ary << line }
      grid.rotate.each { |line| ary << line }
      grid.right_diagonals.each { |line| ary << line }
      grid.left_diagonals.each { |line| ary << line }
      ary
    end

    def draw?
    end
  end
end
