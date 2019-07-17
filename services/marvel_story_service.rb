class MarvelStoryService < MarvelService
  def find_characters_for_story(story_id)
    results = fetch("stories/#{story_id}/characters")

    results[:data][:results].map do |character_hash|
      character = MarvelCharacter.new(character_hash.slice(:id, :name, :description))
      character.thumbnail_url = ThumbnailService.new.fetch(character_hash[:thumbnail])
      character
    end
  end
end
