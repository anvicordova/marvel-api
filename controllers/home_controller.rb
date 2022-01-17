class HomeController < ApplicationController
  get "/" do
    character = Marvel::CharacterService.new.find_by_name(params.fetch(:name, "storm"))

    if character
      story = Marvel::CharacterService.new.pick_random_story_for(character.id, character.number_of_stories)
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
