class Rover
  attr_reader :state

  def initialize(input, plateau)
    @plateau = plateau

    @state = {
      x:    input.shift.to_i,
      y:    input.shift.to_i,
      face: input.shift
    }

    @attributes = input.join.split(//)
  end

  def action(direction)
    case direction
      when 'L' then turn_left
      when 'R' then turn_right
      when 'M' then move_forward
    end
  end

  def move
    while (direction = @attributes.shift)
      action(direction)
    end
  end

  def to_s
    "#{@state[:x]} #{@state[:y]} #{@state[:face]}"
  end

  private

  def turn_left
    @state[:face] = case @state[:face]
      when 'N' then 'W'
      when 'W' then 'S'
      when 'S' then 'E'
      when 'E' then 'N'
    end
  end

  def turn_right
    @state[:face] = case @state[:face]
      when 'N' then 'E'
      when 'E' then 'S'
      when 'S' then 'W'
      when 'W' then 'N'
    end
  end

  def move_forward
    x, y = case @state[:face]
      when 'N' then [0, 1]
      when 'S' then [0, -1]
      when 'E' then [1, 0]
      when 'W' then [-1, 0]
    end

    new_x = @state[:x] + x
    new_y = @state[:y] + y

    if @plateau.within_bounds?(new_x, new_y)
      @state[:x] = new_x
      @state[:y] = new_y
    end
  end
end
