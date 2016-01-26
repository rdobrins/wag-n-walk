# class SendTextController < ApplicationController
#
#   def send_text_message
#     number_to_send_to = params
#
#     twilio_sid = "TWILIO_TEST_ACCT_SID"
#     twilio_token = "TWILIO_TEST_AUTHTOKEN"
#     twilio_phone_number = "6165555555"
#
#     @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
#
#     @twilio_client.account.sms.messages.create(
#       :from => "+1#{twilio_phone_number}",
#       :to => number_to_send_to,
#       :body => "#{@membership.dog.name} has been registered for a walk on #{@membership.walk.date} with #{@membership.walker.first_name}."
#     )
#   end
# end
