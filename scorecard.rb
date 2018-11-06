class Scorecard
  attr_accessor :ball_summary, :ball_no
  def initialize( ball_no = nil , ball_summary = nil)
    @ball_no = ball_no
    @ball_summary = ball_summary
  end
  def display_after_each_ball()
    puts "#{@ball_no} #{@ball_summary}"
    "#{@ball_no} #{@ball_summary}"

  end
  def display_team_allout(team)
    puts "\n#{team} is all out!"
    "#{team} is all out!"
  end
  def display_team(team)
    puts "#{team}"
    team
  end
end