class MarvelCharacterService < MarvelService
  def find_by_name(name)
    results = fetch("characters", name: name)
    character_hash = results[:data][:results].first

    character = MarvelCharacter.new(character_hash.slice(:id, :name, :description))
    character.number_of_stories = character_hash[:stories][:available]
    character
  end

  def find_stories_for_character(character_id)
    results = fetch("characters/#{character_id}/stories")

    results[:data][:results].map do |story|
      MarvelStory.new(story.slice(:id, :title))
    end
  end
end
