require_relative 'spec_helper'

#Allow units to die

describe Unit do
  before :each do
    @footman = Footman.new
  end

  it "should be alive initially" do
    expect(@footman.dead?).to eq false
  end

  it "should die if it takes fatal damage" do
    @footman.damage(60) #footmen have 60 HP
    expect(@footman.dead?).to eq true
  end

  it "should die if it takes more than fatal damage" do
    @footman.damage(600) #footmen have 60 HP
    expect(@footman.dead?).to eq true
  end

end
