class MarvelCharacterService < MarvelService

  def find_by_name(name)
    results = fetch("characters", name: name)
    character_hash = results[:data][:results].first

    MarvelCharacter.new(character_hash.slice(:id, :name, :description))
  end
end
