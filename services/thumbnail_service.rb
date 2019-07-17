class ThumbnailService
  DEFAULT_VARIANT = "portrait_incredible"

  def fetch(thumbnail_info, variant = DEFAULT_VARIANT)
    thumbnail_info.fetch(:path) + "/#{DEFAULT_VARIANT}." + thumbnail_info.fetch(:extension)
  end
end
