class MarvelStory
  attr_accessor :id, :title, :description, :attribution

  def initialize(attributes, attribution)
    self.id = attributes[:id]
    self.title = attributes[:title]
    self.description = attributes[:description].empty? ? nil : attributes[:description]
    self.attribution = attribution
  end
end
