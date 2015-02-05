module ConnectFour
  class Board
    attr_reader :grid

    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
    end

    def drop_in(column, token)
      return false if grid[column].compact.size == 6
      grid[column].compact! << token
      (6 - grid[column].size).times { grid[column].push(nil) }
    end

    def game_over
      return :winner if winner?
      return :draw if draw?
      false
    end

    def default_grid
      Array.new(7) { Array.new(6) { nil } }
    end

    def winner?
      pattern = /(\S)\1{3}/
      lines.any? { |line| line.join.match(pattern) }
    end

    def lines
      ary = []
      grid.each { |line| ary << line }
      grid.rotate.each { |line| ary << line }
      grid.right_diagonals.each { |line| ary << line }
      grid.left_diagonals.each { |line| ary << line }
      ary.map { |e| e.map { |f| f.nil? ? " " : f } }
    end

    def draw?
      grid.all? { |column| column.compact.size == 6 }
    end

    def formatted_grid
      puts " 1 2 3 4 5 6 7"
      puts "╭─────────────╮"
      grid.rotate.reverse.each_with_index do |row, i|
        next if i == 0 # bad fix
        print "│"
        print row.map { |cell| cell.nil? ? " " : cell }.join(" ")
        puts "│"
      end
      puts "╰─────────────╯"
    end
  end
end
