require 'sinatra/base'

class WhatsAppBot < Sinatra::Base
  get '/bot' do
    body = params['Body'].downcase
  end
end
