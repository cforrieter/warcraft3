require_relative 'spec_helper'

# Barracks should also be able to train peasants, much like they could train footmen

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  describe "#train_siege_engine" do
    it "costs 200 gold" do
      @barracks.train_siege_engine
      expect(@barracks.gold).to eq(800) # starts at 1000
    end

    it "costs 60 lumber" do
      @barracks.train_siege_engine
      expect(@barracks.lumber).to eq(440) # starts at 500
    end

    it "costs 3 food" do
      @barracks.train_siege_engine
      expect(@barracks.food).to eq(77) # starts at 80
    end

    it "produces a siege engine unit" do
      siege = @barracks.train_siege_engine
      expect(siege).to be_an_instance_of(SiegeEngine)
    end
  end

  describe "#can_train_siege_engine?" do
    it "returns true if there are enough resources to train a siege engine" do
      # now check to see if one is trainable
      # can jump right to the test since barracks start off with enough gold, lumber and food to train multiple siege engines
      expect(@barracks.can_train_siege_engine?).to be_truthy
    end

    it "returns false if there isn't enough food" do
      # Make the barracks believe it only has 2 food items left, even though it starts with 80
      # This is done by overwriting the `food` getter method
      expect(@barracks).to receive(:food).and_return(2)
      expect(@barracks.can_train_siege_engine?).to be_falsey
    end

    it "returns false if there isn't enough gold" do
      # Make the barracks believe it only has 199 gold left, even though it starts with 1000
      # This is done by overwriting the `gold` getter method
      expect(@barracks).to receive(:gold).and_return(199)
      expect(@barracks.can_train_siege_engine?).to be_falsey
    end

    it "returns false if there isn't enough lumber" do
      # Make the barracks believe it only has 59 lumber left, even though it starts with 500
      # This is done by overwriting the `gold` getter method
      expect(@barracks).to receive(:lumber).and_return(59)
      expect(@barracks.can_train_siege_engine?).to be_falsey
    end
  end

  describe "#train_siege_engine" do
    it "does not train a siege engine if there aren't enough resources" do
      expect(@barracks).to receive(:can_train_siege_engine?).and_return(false)
      expect(@barracks.train_siege_engine).to be_nil
    end
    it "trains a peasant if there are enough resources" do
      expect(@barracks).to receive(:can_train_siege_engine?).and_return(true)
      expect(@barracks.train_siege_engine).to be_a(SiegeEngine)
    end
  end
end

describe SiegeEngine do
  before :each do
    @siege1 = SiegeEngine.new
    @siege2 = SiegeEngine.new
    @footman = Footman.new
    @barracks = Barracks.new
  end

  describe "#attack!" do

    it "deals double damage to buildings" do
      @siege1.attack!(@barracks)
      expect(@barracks.health_points).to eq(400) #siege does 100 damage to buildings
    end

    it "can attack other siege engines" do
      @siege1.attack!(@siege2)
      expect(@siege2.health_points).to eq(350) #siege deals 50 damage to other sieges
    end

    it "cannot attack footmen" do
      @siege1.attack!(@footman)
      expect(@footman.health_points).to eq(60) #60 health is starting health
    end
  end

  describe "#damage" do
    it "takes damage" do
      @siege1.damage(10)
      expect(@siege1.health_points).to eq(390) #starts at 400 HP
    end
  end
end

describe Footman do
  before :each do
    @footman = Footman.new
    @siege = SiegeEngine.new
  end

  describe "#attack!" do
    it "can attack a siege engine" do
      @footman.attack!(@siege)
      expect(@siege.health_points).to eq(390) #footmen deal 10 damage
    end
  end
end