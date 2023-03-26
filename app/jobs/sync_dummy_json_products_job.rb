class SyncDummyJsonProductsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    response = DummyJson.products
    return unless response

    api_products = response["products"]
    api_products.each do |api_product|
      existing_product = Product.where(
        external_id: api_product["id"].to_s,
        external_api: Product::EXTERNAL_API_DUMMY_JSON
      ).first
      if !existing_product
        product = DummyJsonProductsMapper.map(api_product)
        product.product_category = ProductCategory.where(name: api_product["category"]).first_or_create
        product.save
      else
        #TODO: update the existing product
      end
    end
  end
end
