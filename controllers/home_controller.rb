class HomeController < ApplicationController
  get "/" do
    character = Marvel::CharacterService.new.find_by_name(params.fetch(:name, "storm"))

    if character
      story = Marvel::StoryService.new.find_story_by(character: character)
      characters =  Marvel::StoryService.new.find_characters_for_story(story.id)

      @story = {
        character: character,
        story: MarvelStoryDecorator.new(story),
        characters: characters,
        attribution: story.attribution
      }

      erb :index
    else
      erb :not_found
    end
  end
end
