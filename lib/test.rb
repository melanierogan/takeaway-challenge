require 'rubygems'
require 'twilio-ruby'

# Your Account Sid and Auth Token from twilio.com/console
# DANGER! This is insecure. See http://twil.io/secure
class Test
def initialize(client = Twilio::REST::Client)
  @new_client = client.new(ENV["TWILIO_ID"], ENV["TWILIO_TOKEN"])
  @text_list = []
  @latest_text
end


def search_text
  messages = @new_client.sms_messages.list(
    to: ENV["TWILIO_NUMBER"],
    from: ENV["CUSTOMER_NUMBER"],
    limit: 1)


    messages.each do |record|
      puts record.sid
    end
    # messages.each do |record|
    #   @text_list << record.sid
    # end
    # @latest_text = @text_list.last
    # @latest_text
    
end
end