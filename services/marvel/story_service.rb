module Marvel
  class StoryService < BaseService
    def find_characters_for_story(story_id)
      results = fetch("stories/#{story_id}/characters")

      results[:data][:results].map do |character_hash|
        Marvel::Character.new(character_hash, results[:attributionText])
      end
    end
  end
end