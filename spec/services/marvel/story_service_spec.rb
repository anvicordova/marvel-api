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
end
