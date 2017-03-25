################################
# base info
# 用来存放所有Socket请求
# created by yan on 17/3/20
# blog mia2002.cn
################################

class YNSocketQueue

	def initialize()
		@queue=Queue.new
	end

	def push(socket)
		raise "Illegal Argument, must be a TCPSocket Object!!" unless socket.is_a? TCPSocket
		if socket != nil
			@queue << socket
		end
	end

	def take
		@queue.pop
	end
end



