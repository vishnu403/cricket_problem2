require_relative ("../match.rb")
require_relative ("../team.rb")

describe "setting up initial strike for the playing team" do
  it "should return player1 from team1 as it will get on strike" do
    player1_probability = PlayerProbability.new(5,30,25,10,15,1,9,5)
    player2_probability = PlayerProbability.new(10,40,20,5,15,1,4,10)
    player3_probability = PlayerProbability.new(10,40,20,5,15,1,4,10)
    player4_probability = PlayerProbability.new(10,40,20,5,15,1,4,10)

    player1 = Player.new("player1", player1_probability)
    player2 = Player.new("player2", player2_probability)
    player3 = Player.new("player2", player3_probability)
    player4 = Player.new("player2", player4_probability)


    team1 = Team.new(player1, player2, "Team1")
    team2 = Team.new(player3, player4, "Team2")

    match = Match.new(team1, team2)
    match.set_initial_strike()
    expect(match.get_strike_player()).to eql(player1)
  end
  it "should return player2 from team1 as it will get on strike" do
    player1_probability = PlayerProbability.new(0,100,0,0,0,0,0,0)
    player2_probability = PlayerProbability.new(10,40,20,5,15,1,4,10)
    player3_probability = PlayerProbability.new(10,40,20,5,15,1,4,10)
    player4_probability = PlayerProbability.new(10,40,20,5,15,1,4,10)

    player1 = Player.new("player1", player1_probability)
    player2 = Player.new("player2", player2_probability)
    player3 = Player.new("player2", player3_probability)
    player4 = Player.new("player2", player4_probability)


    team1 = Team.new(player1, player2, "Team1")
    team2 = Team.new(player3, player4, "Team2")

    match = Match.new(team1, team2)
    match.set_initial_strike()
    match.carry_on()
    expect(match.get_strike_player()).to eql(player2)
  end
  it "should return player1 from team1 as it will get on strike" do
    player1_probability = PlayerProbability.new(0,100,0,0,0,0,0,0)
    player2_probability = PlayerProbability.new(0,100,0,0,0,0,0,0)
    player3_probability = PlayerProbability.new(10,40,20,5,15,1,4,10)
    player4_probability = PlayerProbability.new(10,40,20,5,15,1,4,10)

    player1 = Player.new("player1", player1_probability)
    player2 = Player.new("player2", player2_probability)
    player3 = Player.new("player2", player3_probability)
    player4 = Player.new("player2", player4_probability)


    team1 = Team.new(player1, player2, "Team1")
    team2 = Team.new(player3, player4, "Team2")

    match = Match.new(team1, team2)
    match.set_initial_strike()
    match.carry_on()
    match.carry_on()
    expect(match.get_strike_player()).to eql(player1)
  end
  it "should return player1 from team1 as it will get on strike" do
    player1_probability = PlayerProbability.new(0,100,0,0,0,0,0,0)
    player2_probability = PlayerProbability.new(0,100,0,0,0,0,0,0)
    player3_probability = PlayerProbability.new(10,40,20,5,15,1,4,10)
    player4_probability = PlayerProbability.new(10,40,20,5,15,1,4,10)

    player1 = Player.new("player1", player1_probability)
    player2 = Player.new("player2", player2_probability)
    player3 = Player.new("player2", player3_probability)
    player4 = Player.new("player2", player4_probability)


    team1 = Team.new(player1, player2, "Team1")
    team2 = Team.new(player3, player4, "Team2")

    match = Match.new(team1, team2)
    match.set_initial_strike()
    match.change_playing_team()
    expect(match.get_playing_team()).to eql(team2)
  end

end