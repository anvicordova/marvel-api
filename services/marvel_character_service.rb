class MarvelCharacterService < MarvelService
  def find_by_name(name)
    results = fetch("characters", name: name)
    character_hash = results[:data][:results].first

    MarvelCharacter.new(character_hash.slice(:id, :name, :description))
  end

  def find_stories_for_character(character_id)
    results = fetch("characters/#{character_id}/stories")

    results[:data][:results].map do |story|
      MarvelStory.new(story.slice(:id, :title))
    end
  end
end
