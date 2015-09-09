class Unit
  attr_reader :health_points, :attack_power
  
  def initialize(hp, ap)
    @health_points = hp
    @attack_power = ap
    @attack_power_strength = {}
  end

  def attack!(enemy)
    unless enemy.dead? || self.dead?
      enemy.damage(get_attack_power(enemy.class.to_s.to_sym))
    end
  end

  def get_attack_power(enemy)
    if @attack_power_strength[enemy]
      return @attack_power_strength[enemy] * @attack_power
    else
      return @attack_power
    end
  end

  def damage(amount)
    @health_points -= amount
  end

  def dead?
    return true if @health_points <= 0
    return false
  end
end