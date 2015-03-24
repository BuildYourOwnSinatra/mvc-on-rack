$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

autoload :Task,              'models/Task'
autoload :TasksController,   'controllers/tasks'
autoload :WeatherController, 'controllers/weather'

require 'tilt'
require 'slim'
require_relative '../lib/base_app'
require_relative '../lib/text_helpers'

class App
  def call(env)
    [200, {}, ['Hello World!']]
  end
end
