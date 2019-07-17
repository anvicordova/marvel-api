class MarvelStoryDecorator < SimpleDelegator
  def description
    super ? super : "No description available for this story."
  end
end
