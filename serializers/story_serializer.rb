# frozen_string_literal: true

module Serializers
  class StorySerializer
    include ::FastJsonapi::ObjectSerializer

    attributes :id, :title, :description
  end
end
