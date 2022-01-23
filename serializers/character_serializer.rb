# frozen_string_literal: true

module Serializers
  class CharacterSerializer
    include ::FastJsonapi::ObjectSerializer

    attributes :id, :name, :description

    attributes :thumbnail_url do |character, params|
      character.thumbnail_url(params[:thumbnail_variant], params[:thumbnail_size])
    end
  end
end
