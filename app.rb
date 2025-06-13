require 'sinatra'
require 'json'
require_relative 'lib/shopee-api' # adapte conforme o caminho real

get '/' do
  'Shopee API Wrapper Online'
end

get '/products' do
  content_type :json
  # Exemplo de chamada usando a gem local
  # Substitua pelo método real da sua lib
  client = Shopee::Client.new(
    partner_id: ENV['SHOPEE_PARTNER_ID'],
    partner_key: ENV['SHOPEE_PARTNER_KEY'],
    redirect: ENV['SHOPEE_REDIRECT_URL']
  )
  
  result = client.get_items # adapte esse método conforme sua gem
  result.to_json
end
