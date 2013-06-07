require_relative '../spec_helper'

describe Validator do

  let(:validator) { Validator.new }

  it "only accepts an integer as an arguement for player count" do
    invalid_input = "not an integer"
    expect(validator.valid_player_count?(invalid_input)).to be false
    valid_input = 3
    expect(validator.valid_player_count?(valid_input)).to be true
  end

  it "does not accept less than 1 or more than 5 players" do
    number = 0
    expect(validator.valid_player_count?(number)).to be false
    number = 6
    expect(validator.valid_player_count?(number)).to be false
  end

  it "does not accept a blank name" do
    name = ""
    expect(validator.name_present?(name)).to be false
  end

  it "does not accept duplicate names" do
    name_1 = "Player"
    name_2 = "Player"
    players = [name_1]
    expect(validator.unique_name?(players, name_2)).to be false
  end

  it "is case insensitive when validating names" do
    name_1 = "Player"
    name_2 = "player"
    players = [name_1]
    expect(validator.unique_name?(players, name_2)).to be false
  end


end