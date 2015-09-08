# http://classic.battle.net/war3/human/units/footman.shtml

class Footman < Unit
  
  FOOTMAN_STARTING_HP = 60
  FOOTMAN_STARTING_AP = 10

  def initialize
    # Need to default the 2 instance variables here
    # Also also give code outside this class access to these variables (via attr_reader, attr_writer or attr_accessor)
    super(FOOTMAN_STARTING_HP, FOOTMAN_STARTING_AP)
  end

end
