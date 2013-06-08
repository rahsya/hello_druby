require 'drb/drb'
require 'yaml'

$SAFE = 0 # disable eval() and friends

# The URI for the server to connect to
config = YAML.load_file('config.yml')
URI = config["server_uri"] 
puts URI

class TimeServer

  def get_current_time
    return Time.now
  end

end

# The object that handles requests on the server
FRONT_OBJECT = TimeServer.new

DRb.start_service(URI, FRONT_OBJECT)
# Wait for the drb server thread to finish before exiting.
DRb.thread.join
