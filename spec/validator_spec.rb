require_relative '../spec_helper'

describe Validator do

  let(:validator) { Validator.new }

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
