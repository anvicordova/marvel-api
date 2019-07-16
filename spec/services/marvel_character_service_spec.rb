require File.expand_path "../../spec_helper.rb", __FILE__

describe MarvelCharacterService do
  describe "#find_by_name" do
    it "returns the first MarvelCharacter it finds with the given name" do
      subject = MarvelCharacterService.new.find_by_name("storm")
      expect(subject).to be_a(MarvelCharacter)
    end

    it "returns the basic information of the given character" do
      subject = MarvelCharacterService.new.find_by_name("storm")
      expect(subject.id).to eq(1009629)
      expect(subject.name).to eq("Storm")
      expect(subject.description).to eq("Ororo Monroe is the descendant of an ancient line of African priestesses, all of whom have white hair, blue eyes, and the potential to wield magic.")
    end
  end
end
