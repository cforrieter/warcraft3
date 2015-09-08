class Barracks
  attr_reader :gold, :food
  
  STARTING_GOLD = 1000
  STARTING_FOOD = 80

  FOOTMAN_GOLD_COST = 135
  FOOTMAN_FOOD_COST = 2

  PEASANT_GOLD_COST = 90
  PEASANT_FOOD_COST = 5

  def initialize
    @gold = STARTING_GOLD
    @food = STARTING_FOOD
  end

  def can_train_footman?
    if (gold - FOOTMAN_GOLD_COST) >= 0 && (food - FOOTMAN_FOOD_COST) >= 0
      return true
    else
      return false
    end
  end

  def train_footman
    if can_train_footman?
      @gold -= FOOTMAN_GOLD_COST
      @food -= FOOTMAN_FOOD_COST
      return Footman.new
    else
      return nil
    end
  end

  def can_train_peasant?
    if (gold - PEASANT_GOLD_COST) >= 0 && (food - PEASANT_FOOD_COST) >= 0
      return true
    else
      return false
    end
  end

  def train_peasant
    if can_train_peasant?
      @gold -= PEASANT_GOLD_COST
      @food -= PEASANT_FOOD_COST
      return Peasant.new
    else
      return nil
    end
  end
end
