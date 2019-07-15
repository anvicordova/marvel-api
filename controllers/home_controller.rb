class HomeController < ApplicationController
  get "/" do
    character = MarvelCharacterService.new.find_by_name("storm")
    stories = MarvelCharacterService.new.find_stories_for_character(character.id)
    characters =  MarvelStoryService.new.find_characters_for_story(stories[1].id)

    @story = {
      character: character,
      stories: stories,
      characters: characters
    }
    erb :index
  end
end
