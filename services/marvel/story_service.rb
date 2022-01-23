# frozen_string_literal: true

module Marvel
  class StoryService
    def initialize
      @marvel_api = Marvel::Api.new
    end

    def find_stories_by(character_id:)
      response = @marvel_api.fetch("characters/#{character_id}/stories", offset: 0, limit: 10)

      return unless response.success?

      response.data[:results].map do |story|
        Marvel::Story.new(story, response.data[:attribution])
      end
    end
  end
end
