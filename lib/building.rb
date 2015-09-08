class Building
  attr_reader :gold, :lumber, :food, :health_points

  def initialize(gold, lumber, food, hp)
    @gold = gold
    @lumber = lumber
    @food = food
    @health_points = hp
  end

  def dead?
    return true if @health_points <= 0
    return false
  end


  def damage(amount)
    @health_points -= amount
  end
  
end