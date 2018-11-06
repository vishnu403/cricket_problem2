require_relative("../scorecard.rb")



describe "testing after each ball" do
  it "should return the status after each ball" do
    scorecard= Scorecard.new(0.1,"test1 scores 2 runs")
    expect(scorecard.display_after_each_ball()).to eql("0.1 test1 scores 2 runs")
  end
  it "should return the status after each ball" do
    scorecard= Scorecard.new(0.6,"test1 scores 2 runs")
    expect(scorecard.display_after_each_ball()).to eql("0.6 test1 scores 2 runs")
  end
end

describe "testing for commentry" do
  it "should return team name" do
    scorecard= Scorecard.new(nil,"test1 scores 2 runs")
    expect(scorecard.display_team("Team 1")).to eql("Team 1")
  end
  it "should return team all out commentry" do
    scorecard= Scorecard.new(nil,"test1 scores 2 runs")
    expect(scorecard.display_team_allout("Team 1")).to eql("Team 1 is all out!")
  end
end