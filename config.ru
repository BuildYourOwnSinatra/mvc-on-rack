$LOAD_PATH.unshift '.'

require 'app/application'

map '/weather' do
  run WeatherController
end

run App
