class WeatherController < BaseApp
	get '/status' do |env|
		Rack::Response.new("It is sunny with a slight chance of apocalypse!", 200)
	end
end
