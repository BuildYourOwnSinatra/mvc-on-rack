require 'rspec-html-matchers'
require 'rack/test'
require 'rack'
require_relative '../app/app'

RSpec.configure do |config|
	config.include Rack::Test::Methods
	config.include RSpecHtmlMatchers

	def app
    path = File.expand_path('../config.ru', File.dirname(__FILE__))
    Rack::Builder.parse_file(path).first
	end
end
