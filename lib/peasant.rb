class Peasant < Unit

  PEASANT_STARTING_HP = 35
  PEASANT_STARTING_AP = 0

  ATTACK_POWER_STRENGTH = {
    Barracks: 0.5
  }
  
  def initialize
    super(PEASANT_STARTING_HP, PEASANT_STARTING_AP)
  end

end