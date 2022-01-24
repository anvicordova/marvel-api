# frozen_string_literal: true

require 'sinatra/base'

class FakeMarvel < Sinatra::Base
  get '/v1/public/characters' do
    if params[:name] == "error"
      json_response 200, 'character_error.json'
    else
      json_response 200, 'characters.json'
    end
  end

  get '/v1/public/characters/:character_id/stories' do |character_id|
    if character_id == "error"
      json_response 200, 'character_stories_error.json'
    else
      json_response 200, 'character_stories.json'
    end
  end

  get '/v1/public/stories/:story_id/characters' do |story_id|
    if story_id == "error"
      json_response 200, 'character_stories_error.json'
    else
      json_response 200, 'story_characters.json'
    end
  end

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open("#{File.dirname(__FILE__)}/fixtures/#{file_name}", 'rb').read
  end
end
