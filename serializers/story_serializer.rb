# frozen_string_literal: true

module Serializers
  class StorySerializer
    include ::FastJsonapi::ObjectSerializer

    attributes :title, :description
  end
end
