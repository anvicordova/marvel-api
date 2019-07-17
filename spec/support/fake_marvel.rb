require "sinatra/base"

class FakeMarvel < Sinatra::Base
  get "/v1/public/characters" do
    json_response 200, "characters.json"
  end

  get "/v1/public/characters/:character_id/stories" do
    json_response 200, "character_stories.json"
  end

  get "/v1/public/stories/:story_id/characters" do
    json_response 200, "story_characters.json"
  end

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + "/fixtures/" + file_name, "rb").read
  end
end
