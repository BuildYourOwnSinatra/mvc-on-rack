$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require 'json'
require 'rack'
require 'slim'
require './lib/base_app'

autoload :Task,              'models/Task'
autoload :WeatherController, 'controllers/weather'

class App < BaseApp
	get '/tasks' do |env|
		Rack::Response.new(Task.all().to_json, 200)
	end
end
