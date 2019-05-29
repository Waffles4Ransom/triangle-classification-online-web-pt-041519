require 'pry'
class Triangle
  attr_accessor :a, :b, :c
  
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end 
  
  def valid?
    # no negatives, all must be > 0 
    valid = [@a, @b, @c].all?{|side| side > 0}
    # test for triangle inequality 
    valid && (@a + @b > @c) && (@a + @c > @b) && (@b + @c > @a)
  end 
  
  def kind 
    if !valid?
      raise TriangleError
    elsif a == b && b == c
        triangle = :equilateral
    elsif (a != b && b == c) || (a == c && b != c) || (a == b && b != c)
        triangle = :isosceles
    elsif (a != b && b != c) && a != c
        triangle = :scalene
    end
      triangle 
  end 
  
  class TriangleError < StandardError
    def message 
      "Invaild triangle!"
    end
  end 
  
end
