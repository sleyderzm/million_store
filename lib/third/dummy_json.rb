class DummyJson
  URL = 'https://dummyjson.com/'.freeze
  PRODUCTS_PATH = 'products'.freeze
  AVAILABLE_PRODUCTS = 100.freeze

  class << self
    def products
      HttpClient.get(URL + PRODUCTS_PATH, {limit: AVAILABLE_PRODUCTS, skip: 0})
    end
  end
end