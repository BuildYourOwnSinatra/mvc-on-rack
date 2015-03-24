Route = Struct.new(:path, :block)
class BaseApp
  class << self
    %w(GET PUT POST DELETE).each do |verb|
      define_method verb.downcase.to_sym do |path, handler|
        add_route path: path, handler: handler, method: verb
      end
    end

    def routes
      @routes ||= {'GET' => [], 'PUT' => [], 'POST' => [], 'DELETE' => []}
    end

    def add_route(path: path, handler: handler, method: 'GET')
      routes[method].push({route: compile(path), handler: handler})
    end

    def compile path
      if path.respond_to? :match
        path
      elsif path.respond_to? :to_str
        postfix = '/' if path =~ /\/\z/
        segments = path.split('/')
        /\A#{segments.join('/')}#{postfix}\z/
      else
        raise TypeError, path
      end
    end
  end

  def find_route method, path
    self.class.routes[method].each do |route|
      return route if route[:route].match(path)
    end

    nil
  end

  def call(env)
    if route = find_route(env['REQUEST_METHOD'], env['PATH_INFO'])
      self.send(route[:handler], env)
    else
      Rack::Response.new('Not found', 404)
    end
  end

  def render(path)
    Tilt.new(file(path)).render(self)
  end

  def file(path)
    File.join(File.expand_path(File.dirname(__FILE__)), '..', 'app', 'views', path)
  end
end
