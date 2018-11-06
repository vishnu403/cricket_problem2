require_relative("scorecard.rb")
require_relative("match_summary.rb")

class Match
  attr_accessor :team1, :team2, :balls_left, :current_playing_team, :inning, :match_ended
  def initialize(team1, team2)
    @team1 = team1
    @team2 = team2
    @balls_left = 6
    @current_playing_team = @team1
    @inning = 1
    @match_ended = false
  end
  def get_teams
    [@team1, @team2]
  end
  def set_initial_strike()
    Scorecard.new(nil,nil).display_team(get_playing_team().name)
    get_playing_team().get_players().first.change_strike()
  end
  def get_playing_team()
    @current_playing_team
  end
  def get_strike_player()
    get_playing_team().get_players().find { |player| player.is_on_strike? }
  end
  def carry_on()
    outcome = get_strike_player.play_ball()
    @balls_left -= 1
    get_current_status(outcome)
    if(outcome != "out")
      update_score(outcome)
      if(outcome % 2 != 0)
        change_strike_player()
      end
    else
      team_is_allout()
    end
    if(@balls_left == 0 and @inning != 2)
      change_playing_team()
      start_next_inning()
    end
  end
  def update_score(outcome)
    get_playing_team().update_team_score(outcome)
  end
  def change_strike_player()
    get_playing_team().get_players().each { |player| player.change_strike()}
  end
  def change_playing_team()
    @current_playing_team = @team2
  end
  def should_continue?()
    @inning != 2 ? (@balls_left > 0 and match_ended == false) : (@balls_left > 0 and match_ended == false and !@current_playing_team.is_runs_crossed?(@team1.get_final_score()))
  end
  def start_next_inning()
    @inning = 2
    @balls_left = 6
    set_initial_strike()
  end
  def team_is_allout()
    Scorecard.new(nil,nil).display_team_allout(@current_playing_team.name)
    if @inning != 2
      change_playing_team()
      start_next_inning()
    else
      end_match()
    end
  end
  def end_match()
    @match_ended = true
  end
  def get_current_status(outcome)
    ball_no = (6-@balls_left)/10.0
    Scorecard.new(ball_no, get_strike_player().get_ball_summary(outcome)).display_after_each_ball()
  end
  def get_match_summary()
    team1_score = @team1.get_final_score()
    team2_score = @team2.get_final_score()
    team_summaries = get_teams.collect { |team| team.summary()}
    if(team1_score > team2_score )
      MatchSummary.new("\nTeam1 Win By #{team1_score - team2_score} runs", team_summaries)
    else
      MatchSummary.new("\nTeam2 won with #{@balls_left} balls left", team_summaries)
    end
  end
end