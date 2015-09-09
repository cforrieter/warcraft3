require_relative 'spec_helper'

#Allow the barracks to be attacked by footmen. Footmen deal half damage to buildings

describe Barracks do
  before :each do
    @barracks = Barracks.new
  end

  it "has 500 HP" do
    expect(@barracks.health_points).to eq(500)
  end

  describe "#damage" do
    it "should reduce the building's health_points by the attack_power specified" do
      @barracks.damage(10)
      expect(@barracks.health_points).to eq(490) # starts at 500
    end
  end
end

describe Footman do
  before :each do
    @footman = Footman.new
    @barracks = Barracks.new
  end

  it "deal half damage to buildings (5 instead of 10)" do
    @footman.attack!(@barracks)

    expect(@barracks.health_points).to eq(495) #footman should deal 5 damage
  end
end