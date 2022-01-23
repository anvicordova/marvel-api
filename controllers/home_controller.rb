# frozen_string_literal: true

class HomeController < ApplicationController
  get '/character/:name' do |_name|
    character = Marvel::CharacterService.new.find_by_name(params.fetch(:name, 'storm'))

    ::Serializers::CharacterSerializer.new(
      character,
      params: {
        thumbnail_variant: Thumbnail::PORTRAIT,
        thumbnail_size: Thumbnail::INCREDIBLE
      }
    ).serialized_json
  end

  get '/character/:id/stories' do |character_id|
    story = Marvel::StoryService.new.find_stories_by(character_id: character_id)

    ::Serializers::StorySerializer.new(story).serialized_json
  end

  get '/story/:id/characters' do |story_id|
    characters = Marvel::CharacterService.new.find_characters_by(story_id: story_id)

    ::Serializers::CharacterSerializer.new(
      characters,
      params: {
        thumbnail_variant: Thumbnail::PORTRAIT,
        thumbnail_size: Thumbnail::INCREDIBLE
      }
    ).serialized_json
  end
end
