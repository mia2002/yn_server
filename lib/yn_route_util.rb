# require 'yaml'

# 配置请求路由
# create by yan

class YNRouteUtil

	include Enumerable

	@@route_hash = {
		"/RubyServer/hello" => "say_hello",
		"/RubyServer/json" => "test_json",
		"/RubyServer/none" => "none_method"
	}

	
	# def initialize
	# 	@route_hash = Hash.new
	# 	puts "route util initialize"
	# 	_arr = YAML.load_file('route.properties').split(" ")
	# 	puts "route_file: #{_arr}"
	# 	_arr.each do |e|
	# 		__arr = e.split("=")
	# 		@route_hash[__arr[0]] = __arr[1]
	# 	end

	# end

	def get_method(route)
		@@route_hash[route]
	end

	def each
		raise 'please provide a block!' unless block_given?
		@@route_hash.each do |e|
			yield e
		end
	end

end