# frozen_string_literal: true

class Thumbnail
  TYPES = {
    portrait: 'portrait',
    standard: 'standard',
    fantastic: 'fantastic',
    incredible: 'incredible'
  }.freeze

  PORTRAIT = 'portrait'
  STANDARD = 'standard'

  FANTASTIC = 'fantastic'
  INCREDIBLE = 'incredible'

  class << self
    def fetch(thumbnail_info, variant, size)
      thumbnail_info.fetch(:path) + "/#{variant}_#{size}." + thumbnail_info.fetch(:extension)
    end
  end
end
