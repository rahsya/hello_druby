require 'drb/drb'
require 'yaml'
require './common.rb'


# The URI to connect to
config = YAML.load_file('config.yml')
SERVER_URI = config["server_uri"]

# Start a local DRbServer to handle callbacks.
#
# Not necessary for this small example, but will be required
# as soon as we pass a non-marshallable object as an argument
# to a dRuby call.
DRb.start_service

work_server = DRbObject.new_with_uri(SERVER_URI)

work_server.run_task do
  puts "Hey this is from the client!"
end

