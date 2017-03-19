class ProductsController < ApplicationController
  include UriHelper

  def index
    render json: Product.all
  end

  def create
    id = UriHelper.get_product_id_from_uri(params[:url])
    product = FetchProductJob.perform_async(id)
    render :json => :ok
  end

  def show
    render json: Product.find(params).filter_reviews(params["reviewKeyword"])
  end

end
