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
  it "should return the team players" do
    player1_probability = PlayerProbability.new(0,100,0,0,0,0,0,0)
    player2_probability = PlayerProbability.new(0,100,0,0,0,0,0,0)
    player1 = Player.new("player1", player1_probability)
    player2 = Player.new("player2", player2_probability)
    team1 = Team.new(player1, player2, "Team1")
    expect(team1.get_players()).to eql([player1,player2])
  end
end