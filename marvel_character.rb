class MarvelCharacter
  attr_accessor :id, :name, :description

  def initialize(id:, name:, description:)
    self.id = id
    self.name = name
    self.description = description
  end
end
