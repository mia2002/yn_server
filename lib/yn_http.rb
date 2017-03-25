class YNHttp

	def initialize(_status=200,_server="Apache-Coyote/1.1",_pragma="no-cache",_control="no-cache",_content_type="text/json",_charset="UTF-8",_body="")
		@status = _status
		@server = _server
		@pragma = _pragma
		@cache_control = _control
		@content_type = _content_type
		@charset = _charset
		@body = _body
		@content_length = _body.length
	end

	@@status_hash={
		100 => "CONTINUE",
		200 => "OK",
		201 => "CREATED",
		202 => "ACCEPTED",
		204 => "NO CONTENT",
		302 => "MOVED TEMPORARILY",
		400 => "BAD REQUEST",
		401 => "UNAUTHORIZED",
		402 => "PAYMENT REQUIRED",
		403 => "FORBIDDEN",
		404 => "NOT FOUND",
		408 => "REQUEST TIMEOUT",
		409 => "CONFLICT",
		410 => "GONE",
		500 => "INTERNAL SERVER ERROR"
	}

	def status=(_status)
		@status=_status
	end

	def server=(_server)
		@server=_server
	end

	def pragma=(_pragma)
		@pragma=_pragma
	end

	def cache_control=(_control)
		@cache_control=_control
	end

	def content_type=(_content_type)
		@content_type=_content_type
	end

	def charset=(_charset)
		@charset=_charset
	end

	def body=(result)
		@content_length=result.size
		@body=result
	end

	def response
		"HTTP/1.1 #{@status} #{@@status_hash[@status]}\r\n" +
		"Server:#{@server}\r\n" + 
		"Pragma:#{@pragma}\r\n" + 
		"Cache-Control:#{@cache_control}\r\n" + 
		"Content-Type:#{@content_type};charset=#{@charset}\r\n" + 
		"Content-Length:#{@content_length}\r\n" + 
		"\r\n" + 
		"#{@body}"
	end
end





