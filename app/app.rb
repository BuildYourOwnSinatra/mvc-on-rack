$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

autoload :Task,            'models/Task'
autoload :TasksController, 'controllers/tasks'

require 'tilt'
require 'slim'
require_relative '../lib/base_app'

class App
  def call(env)
    [200, {}, ['Hello World!']]
  end
end
