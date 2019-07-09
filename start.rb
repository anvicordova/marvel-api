require "dotenv/load"
require_relative "marvel_service"

#p MarvelService.new.fetch("comics")
p MarvelService.new.fetch("characters")
