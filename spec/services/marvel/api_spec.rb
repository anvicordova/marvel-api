# frozen_string_literal: true

require File.expand_path '../../spec_helper.rb', __dir__

describe Marvel::Api do
  describe '#fetch' do
    it 'should return the JSON file in a hash format' do
      subject = Marvel::Api.new.fetch('characters')
      expect(subject).to be_a(Success)
    end
  end
end
