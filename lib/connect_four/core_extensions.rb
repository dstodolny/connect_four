class Object
  def deep_dup
    dup
  end
end

class Numeric
  def deep_dup
    self
  end
end

class NilClass
  def deep_dup
    self
  end
end

class Array
  def deep_dup
    map { |e| e.deep_dup }
  end

  def right_diagonals
    self.deep_dup.each_with_index { |column, i| (self.size - 1 - i).times { column.unshift(nil) } }.rotate
  end

  def left_diagonals
    self.deep_dup.each_with_index { |column, i| i.times { column.unshift(nil) } }.rotate
  end

  def rotate
    ary = self.deep_dup
    n = [ary.size, ary.map { |column| column.size }.max].max
    ary.each { |column| (n - column.size).times { column.push(nil) } }
    (0..n - 1).map { |row| ary.map { |column| column[row] } }
  end
end
