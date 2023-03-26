# example API structure
# {
#   "id": 1,
#   "title": "iPhone 9",
#   "description": "An apple mobile which is nothing like apple",
#   "price": 549,
#   "discountPercentage": 12.96,
#   "rating": 4.69,
#   "stock": 94,
#   "brand": "Apple",
#   "category": "smartphones",
#   "thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
#   "images": [
#     "https://i.dummyjson.com/data/products/1/1.jpg",
#     "https://i.dummyjson.com/data/products/1/2.jpg",
#     "https://i.dummyjson.com/data/products/1/3.jpg",
#     "https://i.dummyjson.com/data/products/1/4.jpg",
#     "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
#   ]
# }

class DummyJsonProductsMapper
  class << self
    def map(api_product)
      product = Product.new
      product.external_id = api_product["id"]
      product.external_api = Product::EXTERNAL_API_DUMMY_JSON
      product.title = api_product["title"]
      product.description = api_product["description"]
      product.discount_percentage = api_product["discountPercentage"]
      product.rating = api_product["rating"]
      product.stock = api_product["stock"]
      product.brand = api_product["brand"]
      product.thumbnail = api_product["thumbnail"]
      api_product["images"].each do |image_url|
        product.product_images << ProductImage.new(url: image_url)
      end

      product
    end
  end
end
