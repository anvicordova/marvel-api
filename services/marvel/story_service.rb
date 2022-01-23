# frozen_string_literal: true

module Marvel
  class StoryService
    def initialize
      @marvel_api = Marvel::Api.new
    end

    def find_story_by(character:)
      offset = Random.rand(0...character.number_of_stories)

      response = @marvel_api.fetch("characters/#{character.id}/stories", offset: offset, limit: 1)

      return unless response.success?

      story_hash = response.data[:results].first
      Marvel::Story.new(story_hash, response.data[:attribution])
    end
  end
end
