require 'uri'
require 'net/http'
require 'json'

class HttpClient
  class << self
    def get(uri)
      url = URI(uri)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(url)
      response = http.request(request)
      response.code == "200" ? JSON.parse(response.body) : []
    end
  end
end