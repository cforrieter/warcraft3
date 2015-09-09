class Unit
  attr_reader :health_points, :attack_power
  
  ATTACK_POWER_STRENGTH = {}

  def initialize(hp, ap)
    @health_points = hp
    @attack_power = ap
  end

  def attack!(enemy)
    unless enemy.dead? || self.dead?
      enemy.damage(get_attack_power(enemy.class.to_s.to_sym))
    end
  end

  def get_attack_power(enemy)
    if self.class::ATTACK_POWER_STRENGTH[enemy]
      return self.class::ATTACK_POWER_STRENGTH[enemy] * @attack_power
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