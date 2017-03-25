require 'json'
require 'yn_http'
require 'yn_request'

class YNTask
	def initialize(request)
		@request = request
	end

	def method_missing(method_name)
		puts "#{method_name} not found in YNTask,please check yn_route_uril.rb"
		default
	end

	# route: /RubyServer/hello
	def say_hello
		begin
		http = YNHttp.new
		http.content_type = "text/html"
		_param = ""
		@request.each do |e|
			_param+="#{e[0]}=#{e[1]}<br>"
		end
		
		http.body = "<html><head><title>Hello to Ruby Server</title></html><body><h1>Hi,welcome to Yan's ruby server!</h1><p>the request param:<br>#{_param}</p></body></html>"
		# return the response result
		http.response
		rescue Exception => e
			puts e.send(:caller)
		end
		
	end

	# route: /RubyServer/json
	def test_json
		http = YNHttp.new
		http.content_type = "text/json"
		result = JSON.generate(@request.hash)
		http.body = result
		http.response
	end

	def default
		http = YNHttp.new
		http.content_type = "text/html"
		http.status = 404
		http.body = "<html><head><title>Welcome</title></html><body><h1>Welcome to Yan's ruby server!</h1><p><h3>404 Not Found</h3></p></body></html>"
		http.response
	end
end