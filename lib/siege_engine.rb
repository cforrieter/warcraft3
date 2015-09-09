class SiegeEngine < Unit

  SIEGE_ENGINE_STARTING_HP = 400
  SIEGE_ENGINE_STARTING_AP = 50

 

  def initialize
    super(SIEGE_ENGINE_STARTING_HP, SIEGE_ENGINE_STARTING_AP)
    @attack_power_strength = {
      Barracks: 2,
      Footman: 0,
      Peasant: 0
    }
  end

  # def attack!(enemy)
  #   unless enemy.dead? || self.dead?
  #     if enemy.class == Barracks
  #       enemy.damage(@attack_power*2)
  #     elsif enemy.class == SiegeEngine
  #       enemy.damage(@attack_power)
  #     end
  #   end
  # end



end