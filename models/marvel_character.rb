class MarvelCharacter
  attr_accessor :id, :name, :description, :number_of_stories, :thumbnail

  def initialize(attributes)
    self.id = attributes[:id]
    self.name = attributes[:name]
    self.description = attributes[:description]
    self.number_of_stories = attributes[:stories][:available]
    self.thumbnail = attributes[:thumbnail]
  end

  def thumbnail_url(variant, size)
    Thumbnail.fetch(thumbnail, variant, size)
  end
end
