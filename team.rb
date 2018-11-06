class Team
  attr_accessor :name,:players, :score
  def initialize(player1,player2, name)
    @player1 = player1
    @player2 = player2
    @score = 0
    @name = name
  end
  def get_players()
    [@player1,@player2]
  end
  def update_team_score(outcome)
    @score += outcome
  end
  def get_final_score()
    @score
  end
  def summary ()
    team_summary  = get_players.collect { |player| player.summary()}
    team_summary.unshift(@name)
    team_summary
  end
  def is_runs_crossed?(score)
    if(score < @score)
      true
    else
      false
    end
  end
end