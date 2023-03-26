class Product < ApplicationRecord
  EXTERNAL_API_DUMMY_JSON = 'dummy_json'.freeze
  EXTERNAL_API_FAKE_STORE = 'fake_store'.freeze
  belongs_to :product_category
  has_many :product_images
end
