class HomeController < ApplicationController
  get "/" do
    character = MarvelCharacterService.new.find_by_name("storm")

    story = MarvelStoryDecorator.new(
              MarvelCharacterService.new.pick_random_story_for(character.id, character.number_of_stories)
            )
    characters =  MarvelStoryService.new.find_characters_for_story(story.id)

    @story = {
      character: character,
      story: story,
      characters: characters
    }
    erb :index
  end
end
