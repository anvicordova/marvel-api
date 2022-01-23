# frozen_string_literal: true

module Marvel
  class CharacterService
    def initialize
      @marvel_api = Marvel::Api.new
    end

    def find_by_name(name)
      response = @marvel_api.fetch('characters', name: name)
      return unless response.success? && response.data[:total].positive?

      character = response.data[:results].first
      Marvel::Character.new(character, response.data[:attribution])
    end

    def find_characters_by(story:)
      response = @marvel_api.fetch("stories/#{story.id}/characters")

      if response.success?
        response.data[:results].map do |character|
          Marvel::Character.new(character, response.data[:attribution])
        end
      else
        []
      end
    end
  end
end
