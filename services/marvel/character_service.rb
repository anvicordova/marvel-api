module Marvel
  class CharacterService < BaseService
    def find_by_name(name)
      results = fetch("characters", name: name)

      if results[:data][:total] > 0
        character_hash = results[:data][:results].first
        Marvel::Character.new(character_hash, results[:attributionText])
      else
        false
      end
    end

    def pick_random_story_for(character_id, total_stories)
      story_number = Random.rand(0..total_stories)

      results = fetch("characters/#{character_id}/stories", offset: story_number, limit: 1)
      story_hash = results[:data][:results].first

      Marvel::Story.new(story_hash, results[:attributionText])
    end
  end
end