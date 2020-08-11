require 'sinatra/base'

class WhatsAppBot < Sinatra::Base
  use Rack::TwilioWebhookAuthentication, ENV['TWILIO_AUTH_TOKEN'], '/bot'
  post '/bot' do
    body = params['Body'].downcase
    response = Twilio::TwiML::MessagingResponse.new
    response.message do |msg|
      if msg.start_with? 'translate'
        msg.body("That's great, I will send you a solution soon")
      else
        msg.body('Cool! But that is not clear to me! Sorry!')
      end
    end
    content_type 'text/xml'
    response.to_xml
  end
end
