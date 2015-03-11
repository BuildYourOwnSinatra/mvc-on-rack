Route = Struct.new(:path, :block)
class BaseApp
  @@routes = {'GET' => []}

  def self.call(env)
    if route = self.find_route(env)
      route.block.call(env)
    else
      Rack::Response.new('Not found', 404)
    end
  end

  def self.get path, &block
    @@routes['GET'].push Route.new(path, block)
  end

  def self.find_route env
    if routes = @@routes[env['REQUEST_METHOD']]
      routes.each do |route|
        if route.path.match(env['PATH_INFO'])
          return route
        end
      end
    end

    nil # this is necessary otherwise ruby can get clever and return routes
  end
end
