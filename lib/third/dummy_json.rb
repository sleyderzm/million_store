class DummyJson
  URL = 'https://dummyjson.com/'
  PRODUCTS_PATH = 'products'
  AVAILABLE_PRODUCTS = 100

  class << self
    def products
      HttpClient.get(URL + PRODUCTS_PATH, {limit: AVAILABLE_PRODUCTS, skip: 0})
    end
  end
end