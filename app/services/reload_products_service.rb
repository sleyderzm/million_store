class ReloadProductsService
  HOURS_TO_EXPIRE = (ENV["RELOAD_PRODUCTS_AT_HOURS"]&.to_i || 24).freeze
  CACHE_KEY_PRODUCTS_UPDATED = "products_updated".freeze
  class << self
    def perform
      unless Rails.cache.read(CACHE_KEY_PRODUCTS_UPDATED)
        SyncFakeStoreProductsJob.perform_later
        SyncDummyJsonProductsJob.perform_later
        Rails.cache.write(CACHE_KEY_PRODUCTS_UPDATED, true, expires_in: HOURS_TO_EXPIRE.hours)
      end
    end
  end
end