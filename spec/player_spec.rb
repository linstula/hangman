require_relative '../spec_helper'

describe Player do

	it "has a name" do
		player = Player.new("Player Name")
		expect(player.name).to eql("Player Name")
	end
end
