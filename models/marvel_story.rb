class MarvelStory
  attr_accessor :id, :title, :description

  def initialize(attributes)
    self.id = attributes[:id]
    self.title = attributes[:title]
    self.description = attributes[:description].empty? ? nil : attributes[:description]
  end
end
