require File.expand_path "../../../spec_helper.rb", __FILE__

describe Marvel::StoryService do
  describe "#find_characters_for_story" do
    it "returns an array with the number of characters of the story" do
      subject = Marvel::StoryService.new.find_characters_for_story(21403)
      expect(subject.size).to be 2
    end

    it "returns an array with the characters of the story" do
      subject = Marvel::StoryService.new.find_characters_for_story(21403)

      expect(subject.first.id).to be 1011336
      expect(subject.first.name).to eq "New Mutants"
      expect(subject.last.id).to be 1009629
      expect(subject.last.name).to eq "Storm"
    end
  end

  describe "#find_story_by" do
    subject do
      Marvel::StoryService.new.find_story_by(character: character)
    end

    let!(:character) do
      OpenStruct.new(id: 1009629, number_of_stories: 950)
    end

    it "returns a MarvelStory" do
      expect(subject).to be_a(Marvel::Story)
    end

    it "returns the basic information of the given story" do
      expect(subject.id).to eq(21403)
      expect(subject.title).to eq("Badlands")
      expect(subject.description).to eq("The New Mutants battle the Demon Bear; officer Tom Corsi and nurse Sharon Friedlander are transformed into Indians; Magik defeats the Demon Bear with her Soulsword; Psyche's parents return from the dead, having been freed from the Demon Bear's power.")
    end
  end
end
