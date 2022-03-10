# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  sides = [a, b, c]

  raise TriangleError unless valid_triangle?(sides)

  if equilateral? sides
    :equilateral
  elsif iscoseles? sides
    :isosceles
  else
    :scalene
  end
end

def valid_triangle?(sides)
  (sides.any? { |side| side <= 0 } || inequal?(sides)) ? false : true
end

def inequal?(sides)
  sorted_sides = sides.sort
  (sorted_sides[0] + sorted_sides[1]) <= sorted_sides[2]
end

def equilateral?(sides)
  return true if sides.uniq.size == 1
  false
end

def iscoseles?(sides)
  return true if sides.uniq.size == 2
  false
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
