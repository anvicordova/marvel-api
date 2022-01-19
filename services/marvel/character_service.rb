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
  end
end