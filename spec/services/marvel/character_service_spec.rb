# frozen_string_literal: true

require File.expand_path '../../spec_helper.rb', __dir__

describe Marvel::CharacterService do
  describe '#find_by_name' do
    subject { Marvel::CharacterService.new.find_by_name('storm') }

    it 'returns the first MarvelCharacter it finds with the given name' do
      expect(subject).to be_a(Marvel::Character)
    end

    it 'returns the basic information of the given character' do
      aggregate_failures do
        expect(subject.id).to eq(1_009_629)
        expect(subject.name).to eq('Storm')
        expect(subject.description).to eq(
          "Ororo Monroe is the descendant of an ancient line of African priestesses, \
          all of whom have white hair, blue eyes, and the potential to wield magic.".strip.squeeze(' ')
        )
        expect(subject.number_of_stories).to eq(950)
      end
    end
  end

  describe '#find_characters_by' do
    subject do
      Marvel::CharacterService.new.find_characters_by(story_id: story_id)
    end

    let(:story_id) { 21_403 }

    it 'returns an array with the number of characters of the story' do
      expect(subject.size).to be 2
    end

    it 'returns an array with the characters of the story' do
      aggregate_failures do
        expect(subject.first.id).to be 1_011_336
        expect(subject.first.name).to eq 'New Mutants'
        expect(subject.last.id).to be 1_009_629
        expect(subject.last.name).to eq 'Storm'
      end
    end
  end
end
