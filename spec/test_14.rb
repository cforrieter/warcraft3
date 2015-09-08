require_relative 'spec_helper'

#Dead units cannot attack or being attacked

describe Barracks do
  before :each do
    @barracks = Barracks.new
  end
  
  it "starts with 500 lumber" do
    expect(@barracks.lumber).to eq(500)
  end
end