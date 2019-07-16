require File.expand_path "../../spec_helper.rb", __FILE__

describe MarvelService do
  describe "#fetch" do
    it "should return the JSON file in a hash format" do
      subject = MarvelService.new.fetch("characters")
      expect(subject).to be_a(Hash)
    end
  end
end
