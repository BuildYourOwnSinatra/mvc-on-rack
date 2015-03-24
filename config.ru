require_relative 'app/app.rb'

map '/tasks' do
  run TasksController.new
end

run App.new
