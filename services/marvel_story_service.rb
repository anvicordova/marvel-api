class MarvelStoryService < MarvelService
  def find_characters_for_story(story_id)
    results = fetch("stories/#{story_id}/characters")

    results[:data][:results].map do |character_hash|
      MarvelCharacter.new(character_hash)
    end
  end
end
