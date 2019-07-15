class MarvelStory
  attr_accessor :id, :title

  def initialize(id:, title:)
    self.id = id
    self.title = title
  end
end
