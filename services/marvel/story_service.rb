module Marvel
  class StoryService
    def initialize
      @marvel_api = Marvel::Api.new
    end

    def find_characters_for_story(story_id)
      response = @marvel_api.fetch("stories/#{story_id}/characters")

      if response.success?
        response.data[:results].map do |character|
          Marvel::Character.new(character, response.attribution)
        end
      else
        []
      end
    end
  end
end