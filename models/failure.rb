# frozen_string_literal: true

class Failure
  attr_reader :data

  def initialize(data:)
    @data = data
  end

  def success?
    false
  end

  def failure?
    true
  end
end
