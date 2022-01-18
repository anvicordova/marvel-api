module Marvel
  class StoryService
    def initialize
      @marvel_api = Marvel::Api.new
    end

    def find_characters_for_story(story_id)
      results = @marvel_api.fetch("stories/#{story_id}/characters")

      results[:data][:results].map do |character_hash|
        Marvel::Character.new(character_hash, results[:attributionText])
      end
    end
  end
end