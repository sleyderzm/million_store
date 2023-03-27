class HomeController < ApplicationController
  PAGE_SIZE = 12.freeze
  include Pagy::Backend
  include HomeHelper
  def index
    @categories = ProductCategory.order(:name).all
    @products = filter_products
    @pagy, @products = pagy_countless(@products, items: PAGE_SIZE)
  end
end
