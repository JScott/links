require './base'
server = {
  app: API::Base,
  Host: '0.0.0.0',
  Port: 9292
}
Rack::Server.start server
