class FakeStoreApi
  URL = 'https://fakestoreapi.com/'.freeze
  PRODUCTS_PATH = 'products'.freeze
  class << self
    def products
      HttpClient.get(URL + PRODUCTS_PATH)
    end
  end
end