# frozen_string_literal: true

require File.expand_path '../spec_helper.rb', __dir__

RSpec.describe HomeController do
  describe "/character" do
    it "returns 200 with valid params" do
      response = get "/character/storm"
      expect(response.status).to be 200
    end

    it "returns 404 with invalid params" do
      response = get "/character/error"
      expect(last_response.status).to be 404
    end
  end

  describe "/character/:id/stories" do
    it "returns 200 with valid params" do
      response = get "/character/1009351/stories"
      expect(response.status).to be 200
    end

    it "returns 404 when it cannot find the stories for the character" do
      response = get "/character/error/stories"
      expect(response.status).to be 404
    end
  end

  describe "/story/:id/characters" do
    it "returns 200 with valid params" do
      response = get "/story/702/characters"
      expect(response.status).to be 200
    end

    it "returns 500 when there's an error in the API" do
      response = get "/story/error/characters"
      expect(last_response.status).to be 404
    end
  end
end
