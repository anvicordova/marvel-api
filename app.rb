require "sinatra"
require "dotenv/load"
require_relative "marvel_character_service"

get "/" do
  @character = MarvelCharacterService.new.find_by_name("storm")
  erb :index
end
