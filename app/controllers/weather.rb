class WeatherController < BaseApp
  get '/status', :status

  def status(env)
    Rack::Response.new('It is sunny with a slight chance of apocalypse!', 200)
  end
end
