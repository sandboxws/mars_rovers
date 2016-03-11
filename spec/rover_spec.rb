require File.expand_path('../../lib/plateau', __FILE__)
require File.expand_path('../../lib/rover', __FILE__)

describe Rover, "behaviour" do
  let (:input) { ['1', '2', 'N', 'LMLMLMLMM'] }

  before :each do
    @plateau = Plateau.new "5 5\n1 2 N\nLMLMLMLMM 3 3 E MMRMMRMRRM"
    @rover = Rover.new input, @plateau
  end

  it "spins 90 degree to the left when L is passed" do
    @rover.action 'L'
    expect(@rover.state[:face]).to eq('W')
  end

  it "spins 90 degree to the right when R is passed" do
    @rover.action 'R'
    expect(@rover.state[:face]).to eq('E')
  end

  it "moves forward when M is passed" do
    @rover.action 'M'
    expect(@rover.state[:x]).to eq(1)
    expect(@rover.state[:y]).to eq(3)

    @rover.action 'R'
    @rover.action 'M'
    expect(@rover.state[:x]).to eq(2)
    expect(@rover.state[:y]).to eq(3)

    @rover.action 'R'
    @rover.action 'M'
    expect(@rover.state[:x]).to eq(2)
    expect(@rover.state[:y]).to eq(2)

    @rover.action 'R'
    @rover.action 'M'
    expect(@rover.state[:x]).to eq(1)
    expect(@rover.state[:y]).to eq(2)
  end

  it "moves around" do
    @rover.move
    expect(@rover.state).to eq(x: 1, y: 3, face: 'N')
  end

  it "returns rover's position as string" do
    @rover.move
    expect(@rover.to_s).to eq('1 3 N')
  end

  it "does not allow the rover out of the grid/plateau" do
    5.times { @rover.action 'M' }
    @rover.action 'R'
    5.times { @rover.action 'M' }

    expect(@rover.state).to eq(x: 5, y: 5, face: 'E')

    @rover.action 'R'
    8.times { @rover.action 'M' }
    @rover.action 'R'
    8.times { @rover.action 'M' }

    expect(@rover.state).to eq(x: 0, y: 0, face: 'W')
  end
end
