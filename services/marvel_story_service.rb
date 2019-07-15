class MarvelStoryService < MarvelService
  def find_characters_for_story(story_id)
    results = fetch("stories/#{story_id}/characters")

    results[:data][:results].map do |character|
      MarvelCharacter.new(character.slice(:id, :name, :description))
    end
  end
end
