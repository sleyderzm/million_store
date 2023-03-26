#Example API structure
# {
#   "id": 20,
#   "title": "DANVOUY Womens T Shirt Casual Cotton Short",
#   "price": 12.99,
#   "description": "95%Cotton,5%Spandex, Features: Casual, Short Sleeve, Letter Print,V-Neck,Fashion Tees, The fabric is soft and has some stretch., Occasion: Casual/Office/Beach/School/Home/Street. Season: Spring,Summer,Autumn,Winter.",
#   "category": "women's clothing",
#   "image": "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",
#   "rating": {
#     "rate": 3.6,
#     "count": 145
#   }
# }
class FakeStoreProductsMapper
  class << self
    def map(api_product)
      product = Product.new
      product.external_id = api_product["id"]
      product.external_api = Product::EXTERNAL_API_FAKE_STORE
      product.title = api_product["title"]
      product.description = api_product["description"]
      product.price = api_product["price"]
      product.discount_percentage = 0.0
      product.rating = api_product["rating"]["rate"]
      product.stock = nil
      product.brand = nil
      product.thumbnail = api_product["image"]
      product.product_images << ProductImage.new(url: api_product["image"])
      product
    end
  end
end