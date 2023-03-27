module HomeHelper
  include Pagy::Frontend
  def filter_products
    @products = Product
    @products = @products.where("lower(title) LIKE lower(?)", "%#{params[:title]}%") if params[:title] && !params[:title].empty?
    @products = @products.where("price >= ?", params[:min_price].to_i) if params[:min_price] && !params[:min_price].empty?
    @products = @products.where("price <= ?", params[:max_price].to_i) if params[:max_price] && !params[:max_price].empty?
    @products = @products.where("lower(title) LIKE lower(?)", "%#{params[:title]}%") if params[:title] && !params[:title].empty?
    @products = @products.where(product_category_id: params[:category_id]) if params[:category_id] && !params[:category_id].empty?
    sort_by = params[:sort_by] && !params[:sort_by].empty? ? params[:sort_by] : 'price DESC'
    @products = @products.order(sort_by).all.load_async
  end
end
