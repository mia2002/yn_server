require 'yn_socket_server'
require 'yn_socket_queue'
require 'yn_handle_request'
require 'yaml'

class YNServer
	def self.start_server(port=2000)
		queue = YNSocketQueue.new
		thread2 = Thread.new do
			socket_server = YNSocketServer.new(port,queue)
			socket_server.start_server
		end
		thread = Thread.new do
			handle_request = YNHandleRequest.new(queue)
			handle_request.handle
		end
	end

end