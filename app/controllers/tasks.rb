require 'json'

class TasksController
  def call(env)
    if env['HTTP_ACCEPT'] == 'application/json'
      [200, {"Content-Type" => "application/json"}, [Task.all.to_json]]
    else
      resp = '<ul>'
      Task.all.each do |task|
        resp << "<li>#{task.name}</li>"
      end
      resp << '</ul>'
      [200, {"Content-Type" => "text/html"}, [resp]]
    end
  end
end
