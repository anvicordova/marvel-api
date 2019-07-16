class ApplicationController < Sinatra::Base
  set :views, File.expand_path("../../views", __FILE__)
  set :public_folder, "public"
end
