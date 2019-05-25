require 'twilio-ruby'
require 'dotenv/load'

class Notification
def initialize
@new_client = client.new(ENV["TWILIO_ID"], ENV["TWILIO_TOKEN"])
end

def send_to_me(from, body)
  name = contact_name(from)
  body = "#{name} (#{from}):\n#{body}"
  response = Twilio::TwiML::MessagingResponse.new do |r|
    r.message to: ENV["TWILIO_NUMBER"] do |msg|
      msg.body body
    end
  end
  puts response
end
end