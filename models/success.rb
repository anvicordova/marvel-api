# frozen_string_literal: true

class Success
  attr_reader :data

  def initialize(data:)
    @data = data
  end

  def success?
    true
  end

  def failure?
    false
  end
end
