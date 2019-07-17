class MarvelCharacter
  attr_accessor :id, :name, :description, :number_of_stories

  def initialize(id:, name:, description:)
    self.id = id
    self.name = name
    self.description = description
    self.number_of_stories = number_of_stories
  end
end
