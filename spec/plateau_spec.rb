require File.expand_path('../../lib/plateau', __FILE__)

describe Plateau, "behaviour" do
  let (:input) { "5 5\n1 2 N\nLMLMLMLMM 3 3 E MMRMMRMRRM" }

  before :each do
    @plateau = Plateau.new input
  end

  it "initializes" do
    expect(@plateau).not_to be_nil
  end

  it "sets up the plateau attributes given" do
    expect(@plateau.height).to eq(5)
    expect(@plateau.width).to eq(5)
  end

  it "creates rovers with initial state" do
    expect(@plateau.rovers.count).to eq(2)
    expect(@plateau.rovers[0].state).to eq(x: 1, y: 2, face: 'N')
    expect(@plateau.rovers[1].state).to eq(x: 3, y: 3, face: 'E')
  end

  it "moves the rovers around" do
    @plateau.move_rovers
    expect(@plateau.rovers[0].state).to eq(x: 1, y: 3, face: 'N')
    expect(@plateau.rovers[1].state).to eq(x: 5, y: 1, face: 'E')
  end

  it "returns all rovers current positions as a string" do
    @plateau.move_rovers
    expect(@plateau.to_s).to eq("1 3 N\n5 1 E")
  end
end
