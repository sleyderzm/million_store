class FakeStoreApi
  URL = 'https://fakestoreapi.com/'
  PRODUCTS_PATH = 'products'
  class << self
    def products
      HttpClient.get(URL + PRODUCTS_PATH)
    end
  end
end