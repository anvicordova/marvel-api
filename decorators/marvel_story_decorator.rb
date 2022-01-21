# frozen_string_literal: true

class MarvelStoryDecorator < SimpleDelegator
  def description
    super || 'No description available for this story.'
  end
end
