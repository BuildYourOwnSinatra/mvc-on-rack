require_relative 'app/app.rb'

map '/tasks' do
  run TasksController.new
end

map '/weather' do
  run WeatherController.new
end

run App.new
