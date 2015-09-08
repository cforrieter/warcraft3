require_relative 'spec_helper'

#Dead units cannot attack or being attacked

describe Unit do

  before :each do
    @footman1 = Footman.new
    @footman2 = Footman.new
  end
  
  context "unit is alive" do
    it "should attack other alive units" do
      @footman1.attack!(@footman2)
      expect(@footman2.health_points).to eq(50)
    end

    it "should not attack dead units" do
      @footman2.damage(60)
      expect(@footman2.health_points).to eq(0)

      @footman1.attack!(@footman2)
      expect(@footman2.health_points).to eq(0)
    end
  end
  
  context "unit is dead" do
    it "should not be able to attack" do
      @footman2.damage(60)
      expect(@footman2.health_points).to eq(0)

      @footman2.attack!(@footman1)
      expect(@footman1.health_points).to eq(60)
    end
  end

end