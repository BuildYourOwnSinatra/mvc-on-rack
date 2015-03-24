require 'json'

class TasksController < BaseApp
  include TextHelpers
  
  get '/tasks', :all

  def all(env)
    @tasks = Task.all()

    if env['HTTP_ACCEPT'] == 'application/json'
      [200, {"Content-Type" => "application/json"}, [@tasks.to_json]]
    else
      [200, {"Content-Type" => "text/html"}, [render('tasks/index.slim')]]
    end
  end
end
