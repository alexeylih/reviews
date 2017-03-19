class FetchProductJob
  include SuckerPunch::Job

  def perform(product_id)
    product = ProductFetcher.fetch(product_id)
    Product.new(product).upsert
  end

end
