require 'drb/drb'
require 'yaml'
require './common.rb'

$SAFE = 0 # disable eval() and friends

# The URI for the server to connect to
config = YAML.load_file('config.yml')
URI = config["server_uri"] 

puts "Listening on #{URI} ..."

# The object that handles requests on the server
FRONT_OBJECT = TaskLibrary::Server.new

DRb.start_service(URI, FRONT_OBJECT)

# Wait for the drb server thread to finish before exiting.
DRb.thread.join
