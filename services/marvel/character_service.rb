module Marvel
  class CharacterService
    def initialize
      @marvel_api = Marvel::Api.new
    end

    def find_by_name(name)
      response = @marvel_api.fetch("characters", name: name)

      if response.success? &&  response.data[:total] > 0
        character = response.data[:results].first
        Marvel::Character.new(character, response.attribution)
      else
        false
      end
    end

    def pick_random_story_for(character_id, total_stories)
      story_number = Random.rand(0..total_stories)

      response = @marvel_api.fetch("characters/#{character_id}/stories", offset: story_number, limit: 1)

      if response.success?
        story_hash = response.data[:results].first
        Marvel::Story.new(story_hash, response.attribution)
      else
        nil
      end
    end
  end
end