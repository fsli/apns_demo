require 'houston'

# Environment variables are automatically read, or can be overridden by any specified options. You can also
# conveniently use `Houston::Client.development` or `Houston::Client.production`.
APN = Houston::Client.production
APN.certificate = File.read("./aps_prod.pem")

#replace below token for each device
token = "<2572e722 75d58aa0 79e8b13f 0e2f52ef aca1b8f2 a5ca08b8 a8dc3837 f2702fbb>"
# Create a notification that alerts a message to the user, plays a sound, and sets the badge on the app
notification = Houston::Notification.new(device: token)
notification.alert = "hello message"

# Notifications can also change the badge count, have a custom sound, have a category identifier, indicate available Newsstand content, or pass along arbitrary data.
notification.badge = 88

# And... sent! That's all it takes.
APN.push(notification)
puts "message: #{notification.message}"
puts "Error: #{notification.error}." 