class MarvelCharacterService < MarvelService
  def find_by_name(name)
    results = fetch("characters", name: name)
    character_hash = results[:data][:results].first
    MarvelCharacter.new(character_hash)
  end

  def pick_random_story_for(character_id, total_stories)
    story_number = Random.rand(0..total_stories)

    results = fetch("characters/#{character_id}/stories", offset: story_number, limit: 1)
    story_hash = results[:data][:results].first

    MarvelStory.new(story_hash)
  end
end
