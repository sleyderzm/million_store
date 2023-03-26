class HomeController < ApplicationController
  PAGE_SIZE = 30.freeze
  include Pagy::Backend
  def index
    @products = Product.all.load_async
    @pagy, @products = pagy_countless(@products, items: PAGE_SIZE)
  end
end
