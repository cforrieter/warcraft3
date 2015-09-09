class Barracks < Building
  
  STARTING_GOLD = 1000
  STARTING_FOOD = 80
  STARTING_LUMBER = 500
  STARTING_HP = 500

  FOOTMAN_GOLD_COST = 135
  FOOTMAN_FOOD_COST = 2

  PEASANT_GOLD_COST = 90
  PEASANT_FOOD_COST = 5

  SIEGE_ENGINE_GOLD_COST = 200
  SIEGE_ENGINE_LUMBER_COST = 60
  SIEGE_ENGINE_FOOD_COST = 3

  def initialize
    super(STARTING_GOLD, STARTING_LUMBER, STARTING_FOOD, STARTING_HP)
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

  def can_train_siege_engine?
    if (gold - SIEGE_ENGINE_GOLD_COST) >= 0 && (food - SIEGE_ENGINE_FOOD_COST) >= 0 && (lumber - SIEGE_ENGINE_LUMBER_COST) >=0
      return true
    else
      return false
    end
  end

  def train_siege_engine
    if can_train_siege_engine?
      @gold -= SIEGE_ENGINE_GOLD_COST
      @lumber -= SIEGE_ENGINE_LUMBER_COST
      @food -= SIEGE_ENGINE_FOOD_COST
      return SiegeEngine.new
    else
      return nil
    end
  end
end
