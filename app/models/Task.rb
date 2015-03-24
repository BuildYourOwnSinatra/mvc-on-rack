class Task
  attr_accessor :name

  # Set attributes by key and value
  def initialize(attrs)
    attrs.each {|k,v| send("#{k}=",v)}
  end

  def self.all
    [Task.new(name: 'Make it rain!'),
     Task.new(name: 'Snow is kinda cold!'),
     Task.new(name: 'Snow is frozen')]
  end

  def to_json(options)
    {name: @name}.to_json
  end
end
