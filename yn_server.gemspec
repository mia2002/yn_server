Gem::Specification.new do |s|  
  s.name        = 'yn_server'  
  s.version     = '0.1.1'  
  s.date        = '2017-03-25'  
  s.summary     = 'Ruby Server!'
  s.description = 'A simple socket server gem'
  s.authors     = ['Yan Ng']  
  s.email       = 'yan@yerl.cn'  
  s.files       = %w(
                        lib/yn_handle_request.rb
                        lib/yn_http.rb
                        lib/yn_server.rb
                        lib/yn_request.rb
                        lib/yn_route_util.rb
                        lib/yn_socket_queue.rb
                        lib/yn_socket_server.rb
                        lib/yn_task.rb
                        lib/yn_logo.rb
                    )
  s.homepage    =  
    'http://rubygems.org/gems/yn_server'  
  s.license     = 'MIT'
end  