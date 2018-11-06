class MatchSummary
  attr_accessor :match_result, :team_summaries
  def initialize(match_result, team_summaries)
    @match_result = match_result
    @team_summaries = team_summaries
  end
  def display
    puts @match_result
    puts "\n"
    @team_summaries.map {|team_summary| team_summary.map { |summary| puts summary} }
  end
end