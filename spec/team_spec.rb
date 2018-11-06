describe "team score" do
  it "should update the team score according to the input" do
    team1 = Team.new(nil, nil, "Team1")
    expect(team1.update_team_score(4)).to eql(4)
  end
  it "should return the team final score" do
    team1 = Team.new(nil, nil, "Team1")
    team1.update_team_score(4)
    team1.update_team_score(3)
    expect(team1.get_final_score()).to eql(7)
  end
end