# frozen_string_literal: true

class ApplicationController < Sinatra::Base
  set :views, File.expand_path('../views', __dir__)
  set :public_folder, 'public'
end
