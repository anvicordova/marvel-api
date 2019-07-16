require "sinatra/base"

class FakeMarvel < Sinatra::Base
  get "/v1/public/characters" do
    json_response 200, "characters.json"
  end

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + "/fixtures/" + file_name, "rb").read
  end
end
