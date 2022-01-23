# frozen_string_literal: true

require File.expand_path '../../spec_helper.rb', __dir__

describe Marvel::StoryService do
  describe '#find_stories_by' do
    subject do
      Marvel::StoryService.new.find_stories_by(character_id: character_id)
    end

    let!(:character_id) { 1_009_629 }

    it 'returns the basic information of the given story' do
      aggregate_failures do
        expect(subject.first.id).to eq(21_403)
        expect(subject.first.title).to eq('Badlands')
        expect(subject.first.description).to eq(
          "The New Mutants battle the Demon Bear; officer Tom Corsi and nurse \
          Sharon Friedlander are transformed into Indians; Magik defeats the \
          Demon Bear with her Soulsword; Psyche's parents return from the dead, \
          having been freed from the Demon Bear's power.".strip.squeeze(' ')
        )
      end
    end
  end
end
