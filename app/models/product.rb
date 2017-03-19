class Product
  include Mongoid::Document

  field :name, type: String
  field :salePrice, type: String
  field :reviews, type: Array

  store_in collection: "products", database: "heroku_26t9nfq0"

  def filter_reviews(keyword)
    return self if keyword.blank?
    self["reviews"] = self["reviews"].select { |r| r["reviewText"].include? keyword }
    self
  end

end
