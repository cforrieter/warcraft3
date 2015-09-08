class Unit
  attr_reader :health_points, :attack_power
  
  def initialize(hp, ap)
    @health_points = hp
    @attack_power = ap
  end

  def attack!(enemy)
    unless enemy.dead? || self.dead?
      case self
      when SiegeEngine
        if enemy.class == Barracks
          enemy.damage(@attack_power*2)
        elsif enemy.class == SiegeEngine
          enemy.damage(@attack_power)
        end
      else
        if enemy.class == Barracks
          enemy.damage(@attack_power/2)
        else
          enemy.damage(@attack_power)
        end
      end
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