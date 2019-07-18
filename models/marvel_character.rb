class MarvelCharacter
  attr_accessor :id, :name, :description, :number_of_stories, :thumbnail, :attribution

  def initialize(attributes, attribution)
    self.id = attributes[:id]
    self.name = attributes[:name]
    self.description = attributes[:description]
    self.number_of_stories = attributes[:stories][:available]
    self.thumbnail = attributes[:thumbnail]
    self.attribution = attribution
  end

  def thumbnail_url(variant, size)
    Thumbnail.fetch(thumbnail, variant, size)
  end
end
