class Validator

  def name_present?(name)
    if name != ""
      true
    else
      false
    end
  end

  def unique_name?(player_collection, name)
    uniqueness = true
    player_collection.each do |existing_player|
      if name.downcase == existing_player.downcase
        uniqueness = false
      end
    end
    uniqueness
  end
end
