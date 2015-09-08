# http://classic.battle.net/war3/human/units/footman.shtml

class Footman < Unit
  
  FOOTMAN_STARTING_HP = 60
  FOOTMAN_STARTING_AP = 10

  def initialize
    super(FOOTMAN_STARTING_HP, FOOTMAN_STARTING_AP)
  end

end
