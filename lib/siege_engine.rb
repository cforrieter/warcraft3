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

end