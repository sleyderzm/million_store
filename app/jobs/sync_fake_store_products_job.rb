class SyncFakeStoreProductsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    api_products = FakeStoreApi.products
    return unless api_products

    api_products.each do |api_product|
      existing_product = Product.where(
        external_id: api_product["id"].to_s,
        external_api: Product::EXTERNAL_API_FAKE_STORE
      ).first
      if !existing_product
        product = FakeStoreProductsMapper.map(api_product)
        #TODO: save categories in memory to improve the performance
        product.product_category = ProductCategory.where(name: api_product["category"]).first_or_create
        product.save
      else
        #TODO: update the existing product
      end
    end
  end
end
