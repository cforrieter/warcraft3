class SiegeEngine < Unit

  SIEGE_ENGINE_STARTING_HP = 400
  SIEGE_ENGINE_STARTING_AP = 50

  ATTACK_POWER_STRENGTH = {
    Barracks: 2,
    Footman: 0,
    Peasant: 0
  }

  def initialize
    super(SIEGE_ENGINE_STARTING_HP, SIEGE_ENGINE_STARTING_AP)
  end

end