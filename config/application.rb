# frozen_string_literal: true

require 'sinatra'
require 'sinatra/base'
require 'active_support'
require 'fast_jsonapi'
require 'dotenv/load'

Dir[File.join('controllers', '**/*_controller.rb')].each { |file| require_relative File.expand_path(file) }
Dir[File.join('services', '**/*.rb')].each { |file| require_relative File.expand_path(file) }
Dir[File.join('models', '**/*.rb')].each { |file| require_relative File.expand_path(file) }
Dir[File.join('decorators', '**/*.rb')].each { |file| require_relative File.expand_path(file) }
Dir[File.join('serializers', '**/*.rb')].each { |file| require_relative File.expand_path(file) }
