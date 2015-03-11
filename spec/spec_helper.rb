require 'rack/test'
require 'rack'
require './app/application'

RSpec.configure do |config|
	config.include Rack::Test::Methods

  config.expect_with :rspec do |c|
    c.syntax = :should
  end

  def app
    Rack::Builder.new do
      map '/weather' do 
        run WeatherController
      end 
    	run App
    end
  end
end
