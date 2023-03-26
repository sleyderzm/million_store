require 'uri'
require 'net/http'
require 'json'

class HttpClient
  class << self
    def get(uri, params = nil)
      url = URI(uri)
      url.query = params.map { |k,v| "#{k}=#{v}" }.join("&") if params

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(url)
      response = http.request(request)
      response.code == "200" ? JSON.parse(response.body) : nil
    end
  end
end