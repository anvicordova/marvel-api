require File.expand_path "../../spec_helper.rb", __FILE__

describe MarvelStoryService do
  describe "#find_characters_for_story" do
    it "returns an array with the characters of the story" do
      subject = MarvelStoryService.new.find_characters_for_story(21403)

      characters = [
        MarvelCharacter.new(id: 1011336, name: "New Mutants", description: ""),
        MarvelCharacter.new(id: 1009629, name: "Storm", description: "Ororo Monroe is the descendant of an ancient line of African priestesses, all of whom have white hair, blue eyes, and the potential to wield magic.")
      ]
      
      expect(subject).to match_array(characters)
    end
  end
end
