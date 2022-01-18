require File.expand_path "../../../spec_helper.rb", __FILE__

describe Marvel::CharacterService do
  describe "#find_by_name" do
    it "returns the first MarvelCharacter it finds with the given name" do
      subject = Marvel::CharacterService.new.find_by_name("storm")
      expect(subject).to be_a(Marvel::Character)
    end

    it "returns the basic information of the given character" do
      subject = Marvel::CharacterService.new.find_by_name("storm")
      expect(subject.id).to eq(1009629)
      expect(subject.name).to eq("Storm")
      expect(subject.description).to eq("Ororo Monroe is the descendant of an ancient line of African priestesses, all of whom have white hair, blue eyes, and the potential to wield magic.")
      expect(subject.number_of_stories).to eq(950)
    end
  end

  describe "#pick_random_story_for" do
    it "returns a MarvelStory" do
      subject = Marvel::CharacterService.new.pick_random_story_for(1009629, 950)
      expect(subject).to be_a(Marvel::Story)
    end

    it "returns the basic information of the given story" do
      subject = Marvel::CharacterService.new.pick_random_story_for(1009629, 950)
      expect(subject.id).to eq(21403)
      expect(subject.title).to eq("Badlands")
      expect(subject.description).to eq("The New Mutants battle the Demon Bear; officer Tom Corsi and nurse Sharon Friedlander are transformed into Indians; Magik defeats the Demon Bear with her Soulsword; Psyche's parents return from the dead, having been freed from the Demon Bear's power.")
    end
  end
end
