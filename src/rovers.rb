require File.expand_path('../../lib/plateau', __FILE__)

class Rovers
  def initialize(input = "")
    @input = input
  end

  def start
    plateau = Plateau.new @input

    plateau.move_rovers

    puts plateau
  end
end
