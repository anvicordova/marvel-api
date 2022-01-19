class HomeController < ApplicationController
  get "/" do
    character = Marvel::CharacterService.new.find_by_name(params.fetch(:name, "storm"))

    if character
      story = Marvel::StoryService.new.find_story_by(character: character)
      characters =  story ? Marvel::CharacterService.new.find_characters_by(story: story) : []

      @story = {
        character: character,
        story: MarvelStoryDecorator.new(story),
        characters: characters,
        attribution: story ? story.attribution : character.attribution
      }

      erb :index
    else
      erb :not_found
    end
  end
end
