require 'houston'

# Environment variables are automatically read, or can be overridden by any specified options. You can also
# conveniently use `Houston::Client.development` or `Houston::Client.production`.
APN = Houston::Client.production
APN.certificate = File.read("./development_moteve_apns_sample.pem")

#replace below token for each device
token = "<8c890871 ddc52968 c26095dc 8362ebf6 f2b73623 7424dc76 31ffbc89 943e1f8f>"
# Create a notification that alerts a message to the user, plays a sound, and sets the badge on the app
notification = Houston::Notification.new(device: token)
notification.alert = "hello message"

# Notifications can also change the badge count, have a custom sound, have a category identifier, indicate available Newsstand content, or pass along arbitrary data.
notification.badge = 77

# And... sent! That's all it takes.
APN.push(notification)
puts "message: #{notification.message}"
puts "Error: #{notification.error}." 