require 'socket'
require 'yn_socket_queue'
require 'yn_handle_request'

class YNSocketServer

	# 初始化
	# port 端口号
	def initialize(port,queue)
		@port = port
		@queue = queue
	end

	def start_server
		begin
			@server=TCPServer.open(@port)
			puts "start successfully!!"
			loop{
				@client=@server.accept
				@queue.push(@client)
			}
		rescue Exception => e
			puts e.send(:caller)
		end
		
	end
end