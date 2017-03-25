
class YNRequest

	include Enumerable

	attr_reader :hash

	def initialize(content="")
		@hash = Hash.new
		if content != ""
			_arr = []
			_arr = content.include?("&") ? content.split("&") : _arr.push(content)
			_arr.each do |e|
				__arr = e.split("=")
				@hash[__arr[0].to_sym]=__arr[1]
			end
		end		
	end

	def get(key)
		@hash[key.to_sym]
	end

	def each
		raise 'please provide a block!' unless block_given?
		@hash.each do |e|
			yield e
		end
	end
end