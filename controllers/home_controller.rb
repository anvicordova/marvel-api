class HomeController < ApplicationController
  get "/" do
    @character = MarvelCharacterService.new.find_by_name("storm")
    erb :index
  end
end
