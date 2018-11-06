require_relative ("player.rb")
require_relative ("player_probability.rb")
require_relative ("match.rb")
require_relative ("team.rb")

class MatchStimulator
  attr_accessor :match
  def initialize()
    virat_probability = PlayerProbability.new(5,10,25,10,25,1,14,10)
    dhoni_probability = PlayerProbability.new(5,15,15,10,20,1,19,15)
    ab_devillers_probability= PlayerProbability.new(5,10,25,10,25,1,14,10)
    amla_probability = PlayerProbability.new(10,15,10,10,20,1,19,15)

     virat = Player.new("Virat", virat_probability)
     dhoni = Player.new("Dhoni", dhoni_probability)
     abd = Player.new("AB Devillers", ab_devillers_probability)
     amla  = Player.new("H Amla", amla_probability)


     team1 = Team.new(virat,dhoni, "Team1")
     team2 = Team.new(abd, amla,"Team2")

     @match = Match.new(team1, team2)
  end
  def start_match()
     @match.set_initial_strike()
     while (@match.should_continue?())
       @match.carry_on()
     end
     @match.get_match_summary().display()
  end
end

MatchStimulator.new().start_match()