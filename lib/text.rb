require 'twilio-ruby'
require 'dotenv/load'

class Notification

  attr_accessor :latest_text, :text_order

  def initialize(client = Twilio::REST::Client)
    @new_client = client.new(ENV["TWILIO_ID"], ENV["TWILIO_TOKEN"])
    @text_list = []
    @latest_text
    @text_order
    @search_text
    @print_message
  end

  # # something to ask cohort, or coach...
  # how do i make the initialize of a class 
  # private because i do not want the token 
  # and id printed in irb

  def send_text(message)
    @new_client.messages.create(
      to: ENV["CUSTOMER_NUMBER"],
      from: ENV["TWILIO_NUMBER"],
      body: message)
  end

  # def order_text(message)
  #   twiml = Twilio::TwiML::MessageResponse.new
  #   twiml.message = "Bum off"
  # end

  def search_text
    messages = @new_client.messages.list(
      to: ENV["TWILIO_NUMBER"],
      from: ENV["CUSTOMER_NUMBER"],
      limit: 1)
  
      messages.each do |record|
        @text_list << record.sid
      end
      @latest_text = @text_list.last
      @latest_text
      # @latest_text = 'SMa980e212fcbe095ec9242dc1860a883e'
      @text_order = @new_client.messages(@latest_text).fetch.body
      @text_order
      
  end

  def print_message
    @text_order = @new_client.messages(@latest_text).fetch.body
    @text_order
  end

end
