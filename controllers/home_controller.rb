# frozen_string_literal: true
require "pry"

class HomeController < ApplicationController
  get '/character/:name' do |_name|
    character = Marvel::CharacterService.new.find_by_name(params.fetch(:name, 'storm'))

    if character
      ::Serializers::CharacterSerializer.new(
        character,
        params: {
          thumbnail_variant: Thumbnail::PORTRAIT,
          thumbnail_size: Thumbnail::INCREDIBLE
        }
      ).serialized_json
    else
      status 404
      {
        status: 404,
        error: "Could not find character"
      }.to_json
    end
  end

  get '/character/:id/stories' do |character_id|
    stories = Marvel::StoryService.new.find_stories_by(character_id: character_id)

    if !stories.empty?
      ::Serializers::StorySerializer.new(stories).serialized_json
    else
      status 404
      {
        status: 404,
        error: "Could not find stories for the given character"
      }
    end
  end

  get '/story/:id/characters' do |story_id|
    characters = Marvel::CharacterService.new.find_characters_by(story_id: story_id)

    if !characters.empty?
      ::Serializers::CharacterSerializer.new(
        characters,
        params: {
          thumbnail_variant: Thumbnail::PORTRAIT,
          thumbnail_size: Thumbnail::INCREDIBLE
        }
      ).serialized_json
    else
      status 404
      {
        status: 404,
        error: "Could not find characters for the given story"
      }
    end
  end
end
