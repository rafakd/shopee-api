require "sinatra"
require "json"
require_relative "lib/shopee-api" # ajuste esse caminho se necessário

# Simples rota de teste
get "/" do
  "Shopee API Wrapper Online"
end

# Exemplo: rota de produtos
get "/products" do
  content_type :json

  client = Shopee::Client.new(
    partner_id: ENV["SHOPEE_PARTNER_ID"],
    partner_key: ENV["SHOPEE_PARTNER_KEY"],
    redirect: ENV["SHOPEE_REDIRECT_URL"]
  )

  begin
    result = client.get_items # substitua com o método correto da sua gem
    result.to_json
  rescue => e
    status 500
    { error: e.message }.to_json
  end
end
