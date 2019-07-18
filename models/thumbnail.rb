class Thumbnail
  PORTRAIT = "portrait".freeze
  STANDARD = "standard".freeze

  FANTASTIC = "fantastic".freeze
  INCREDIBLE = "incredible".freeze

  class << self
    def fetch(thumbnail_info, variant, size)
      thumbnail_info.fetch(:path) + "/#{variant}_#{size}." + thumbnail_info.fetch(:extension)
    end
  end
end
