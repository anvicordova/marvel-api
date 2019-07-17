class MarvelStory
  attr_accessor :id, :title, :description

  def initialize(id:, title:, description:)
    self.id = id
    self.title = title
    self.description = description unless description.empty?
  end
end
