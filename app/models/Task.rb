class Task
	attr_accessor :name

  def initialize(attrs)
    attrs.each {|k,v| send("#{k}=",v)}
  end

	def self.all
		[Task.new(name: 'Make it rain!'), Task.new(name: 'Snow is kinda cold!'), Task.new(name: 'Snow is frozen')]
	end

	def to_json(*a)
		{name: @name}.to_json(*a)
	end
end
