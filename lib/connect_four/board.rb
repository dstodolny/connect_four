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

    private

    def default_grid
      Array.new(7) { Array.new }
    end

    def winner?
      columns.any? { |column| column.join.match(/(.)\1{3}/) } ||
        rows.any? { |row| row.join.match(/(.)\1{3}/) }
    end

    def draw?
    end

    def columns
      grid
    end

    def rows
      (0..grid.size - 1).map { |row| grid.map { |column| column[row] } }
    end
  end
end
