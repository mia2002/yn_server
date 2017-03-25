
require 'yn_socket_queue'
require 'yn_request'
require 'yn_task'
require 'yn_route_util'

# 处理http请求
# create by yan
class YNHandleRequest

	def initialize(socket_queue)
		@socket_queue=socket_queue
	end

	def handle
		loop do
			begin
				client = @socket_queue.take
				puts "-----------------------------------"
				_method,path = client.gets.split
				puts "url: #{path}"
				puts "method: #{_method}"
				if (path=~/.+\.(png|ico|gif)/) != nil
					client.close
					next
				end
				headers={}
				while line = client.gets.split(' ',2)
					break if line[0]==""
					headers[line[0].chop] = line[1].strip
				end
				data = ""
				servlet_url = ""
				if _method.upcase == 'POST'
					data = client.read(headers["Content-Length"].to_i)
					puts "data: #{data}"
					servlet_url = path
				elsif _method.upcase == 'GET'
					if path.include? '?'
						# 带参数
						data = path[(path.index('?')+1)..path.length]
						servlet_url = path[0...path.index('?')]
					else
						data = ""
						servlet_url = path
					end
				end

				request = YNRequest.new(data)
				puts "parameter: #{request.hash}"
				util = YNRouteUtil.new
				route = util.get_method(servlet_url)
				task = YNTask.new(request)
				route = "default" if route == nil || route.empty?
				route = route.empty? ? "default" : route
				puts "route: #{route}"
				_result = task.send(route) #动态执行方法
				client.write(_result)
			
			rescue Exception => e
				puts e.send(:caller)
			ensure
				client.close
			end
			
		end
	end
end