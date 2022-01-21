# frozen_string_literal: true

require File.expand_path '../spec_helper.rb', __dir__

describe HomeController do
  it 'should allow accessing the home page' do
    get '/'
    expect(last_response).to be_ok
  end
end
